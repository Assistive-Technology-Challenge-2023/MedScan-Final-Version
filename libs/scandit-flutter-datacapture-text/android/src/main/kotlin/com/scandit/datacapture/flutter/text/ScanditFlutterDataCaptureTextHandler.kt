/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

package com.scandit.datacapture.flutter.text

import com.scandit.datacapture.core.json.JsonValue
import com.scandit.datacapture.flutter.core.common.LastFrameDataHolder
import com.scandit.datacapture.flutter.core.deserializers.Deserializers
import com.scandit.datacapture.flutter.text.data.defaults.SerializableTextCaptureDefaults
import com.scandit.datacapture.flutter.text.listeners.ScanditFlutterTextCaptureListener
import com.scandit.datacapture.text.capture.TextCapture
import com.scandit.datacapture.text.capture.serialization.TextCaptureDeserializer
import com.scandit.datacapture.text.capture.serialization.TextCaptureDeserializerListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class ScanditFlutterDataCaptureTextHandler(
    private val textCaptureListener: ScanditFlutterTextCaptureListener,
    private val textCaptureDeserializer: TextCaptureDeserializer = TextCaptureDeserializer()
) : FlutterPlugin,
    TextCaptureDeserializerListener,
    MethodChannel.MethodCallHandler {

    private var textCaptureDefaultsChannel: MethodChannel? = null
    private var textCaptureListenerChannel: MethodChannel? = null

    private var textCapture: TextCapture? = null
        private set(value) {
            field?.removeListener(textCaptureListener)
            field = value?.also { it.addListener(textCaptureListener) }
        }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        textCaptureDeserializer.listener = this
        Deserializers.Factory.addModeDeserializer(textCaptureDeserializer)
        textCaptureDefaultsChannel = MethodChannel(
            binding.binaryMessenger,
            "com.scandit.datacapture.text.capture.method/text_capture_defaults"
        ).also {
            it.setMethodCallHandler(this)
        }
        textCaptureListenerChannel = MethodChannel(
            binding.binaryMessenger,
            "com.scandit.datacapture.text.capture.method/text_capture_listener"
        ).also {
            it.setMethodCallHandler(this)
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        Deserializers.Factory.removeModeDeserializer(textCaptureDeserializer)
        textCaptureDefaultsChannel?.setMethodCallHandler(null)
        textCaptureListenerChannel?.setMethodCallHandler(null)
        textCaptureDeserializer.listener = null
        textCapture = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getDefaults" -> result.success(SerializableTextCaptureDefaults.createDefaults())
            "addTextCaptureListener" -> {
                textCaptureListener.enableListener()
                result.success(null)
            }
            "removeTextCaptureListener" -> {
                textCaptureListener.disableListener()
                result.success(null)
            }
            "textCaptureFinishDidCapture" -> {
                textCaptureListener.finishDidCaptureText(call.arguments as Boolean)
                result.success(null)
            }
            "getLastFrameData" -> LastFrameDataHolder.handleGetRequest(result)
        }
    }

    override fun onModeDeserializationFinished(
        deserializer: TextCaptureDeserializer,
        mode: TextCapture,
        json: JsonValue
    ) {
        textCapture = mode.also {
            if (json.contains("enabled")) {
                it.isEnabled = json.requireByKeyAsBoolean("enabled")
            }
        }
    }
}
