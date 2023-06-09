/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

package com.scandit.datacapture.flutter.text

import androidx.annotation.NonNull
import com.scandit.datacapture.flutter.core.utils.EventHandler
import com.scandit.datacapture.flutter.text.listeners.ScanditFlutterTextCaptureListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.concurrent.locks.ReentrantLock
import kotlin.concurrent.withLock

/** ScanditFlutterDatacaptureTextPlugin */
class ScanditFlutterDatacaptureTextProxyPlugin : FlutterPlugin, MethodCallHandler {
    companion object {
        @JvmStatic
        private val lock = ReentrantLock()

        @JvmStatic
        private var isPluginAttached = false
    }

    private var scanditFlutterDataCaptureTextHandler:
        ScanditFlutterDataCaptureTextHandler? = null

    override fun onAttachedToEngine(
        @NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
    ) {
        lock.withLock {
            if (isPluginAttached) return

            scanditFlutterDataCaptureTextHandler = ScanditFlutterDataCaptureTextHandler(
                provideScanditFlutterTextCaptureListener(flutterPluginBinding.binaryMessenger)
            )
            scanditFlutterDataCaptureTextHandler?.onAttachedToEngine(flutterPluginBinding)
            isPluginAttached = true
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        result.notImplemented()
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        lock.withLock {
            scanditFlutterDataCaptureTextHandler?.onDetachedFromEngine(binding)
            scanditFlutterDataCaptureTextHandler = null
            isPluginAttached = false
        }
    }

    private fun provideScanditFlutterTextCaptureListener(binaryMessenger: BinaryMessenger) =
        ScanditFlutterTextCaptureListener(
            EventHandler(
                EventChannel(
                    binaryMessenger,
                    ScanditFlutterTextCaptureListener.CHANNEL_NAME
                )
            )
        )
}
