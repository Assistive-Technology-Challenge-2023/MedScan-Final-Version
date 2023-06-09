/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */
package com.scandit.datacapture.flutter.parser

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.locks.ReentrantLock
import kotlin.concurrent.withLock

/** ScanditFlutterDataCaptureParserProxyPlugin. */
class ScanditFlutterDataCaptureParserProxyPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

    companion object {
        @JvmStatic
        private val lock = ReentrantLock()

        @JvmStatic
        private var isPluginAttached = false
    }

    private var methodChannel: MethodChannel? = null

    private var scanditFlutterDataCaptureParserPlugin:
        ScanditFlutterDataCaptureParserMethodHandler? = null

    override fun onAttachedToEngine(binding: FlutterPluginBinding) {
        lock.withLock {
            if (isPluginAttached) return

            scanditFlutterDataCaptureParserPlugin = ScanditFlutterDataCaptureParserMethodHandler()
            scanditFlutterDataCaptureParserPlugin?.onAttachedToEngine(binding)
            methodChannel = MethodChannel(
                binding.binaryMessenger,
                "com.scandit.datacapture.parser.method/parser"
            ).also {
                it.setMethodCallHandler(scanditFlutterDataCaptureParserPlugin)
            }
            isPluginAttached = true
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
        lock.withLock {
            scanditFlutterDataCaptureParserPlugin?.onDetachedFromEngine(binding)
            scanditFlutterDataCaptureParserPlugin = null
            methodChannel?.setMethodCallHandler(null)
            methodChannel = null
            isPluginAttached = false
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        result.notImplemented()
    }
}
