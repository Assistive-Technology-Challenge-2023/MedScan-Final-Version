/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

package com.scandit.datacapture.flutter.parser

import android.util.Base64
import com.scandit.datacapture.core.json.JsonValue
import com.scandit.datacapture.flutter.core.deserializers.DataCaptureContextLifecycleObserver
import com.scandit.datacapture.flutter.core.deserializers.Deserializers
import com.scandit.datacapture.flutter.core.utils.Error
import com.scandit.datacapture.flutter.core.utils.reject
import com.scandit.datacapture.flutter.parser.data.SerializableParseRequest
import com.scandit.datacapture.parser.Parser
import com.scandit.datacapture.parser.serialization.ParserDeserializer
import com.scandit.datacapture.parser.serialization.ParserDeserializerListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject

class ScanditFlutterDataCaptureParserMethodHandler(
    private val parserDeserializer: ParserDeserializer = ParserDeserializer()
) : FlutterPlugin,
    ParserDeserializerListener,
    MethodChannel.MethodCallHandler,
    DataCaptureContextLifecycleObserver.Callbacks {

    private val parsers: MutableMap<String, Parser> = mutableMapOf()

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        parserDeserializer.listener = this
        Deserializers.Factory.addComponentDeserializer(parserDeserializer)
        DataCaptureContextLifecycleObserver.callbacks += this
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        Deserializers.Factory.removeComponentDeserializer(parserDeserializer)
        parserDeserializer.listener = null
        parsers.clear()
        DataCaptureContextLifecycleObserver.callbacks -= this
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            METHOD_PARSE_STRING -> {
                val request = SerializableParseRequest(JSONObject(call.arguments as HashMap<*, *>))
                parseString(request.parserId, request.data, result)
            }
            METHOD_PARSE_RAW_DATA -> {
                val request = SerializableParseRequest(JSONObject(call.arguments as HashMap<*, *>))
                parseRawData(request.parserId, request.data, result)
            }
            else -> result.notImplemented()
        }
    }

    private fun parseString(parserId: String, data: String, result: MethodChannel.Result) {
        val parser = parsers[parserId] ?: run {
            result.reject(ERROR_INVALID_PARSER_ID)

            return
        }

        val parsedData = try {
            parser.parseString(data)
        } catch (e: RuntimeException) {
            result.reject(ERROR_PARSER_FAILURE, e.message)

            return
        }

        result.success(parsedData.jsonString)
    }

    private fun parseRawData(parserId: String, data: String, result: MethodChannel.Result) {
        val parser = parsers[parserId] ?: run {
            result.reject(ERROR_INVALID_PARSER_ID)

            return
        }

        val base64Bytes = try {
            Base64.decode(data, 0)
        } catch (e: IllegalArgumentException) {
            println(e)
            result.reject(ERROR_INVALID_BASE_64)

            return
        }

        val parsedData = try {
            parser.parseRawData(base64Bytes)
        } catch (e: RuntimeException) {
            result.reject(ERROR_PARSER_FAILURE, e.message)

            return
        }

        result.success(parsedData.jsonString)
    }

    override fun onParserDeserializationFinished(
        deserializer: ParserDeserializer,
        parser: Parser,
        json: JsonValue
    ) {
        parsers[parser.id] = parser
    }

    override fun onParsersRemoved() {
        parsers.clear()
    }

    companion object {
        private val ERROR_INVALID_PARSER_ID =
            Error(1, "The parser id does not match the current parser id.")
        private val ERROR_PARSER_FAILURE =
            Error(2, "Parser error: %s")
        private val ERROR_INVALID_BASE_64 =
            Error(3, "Invalid Base64.")

        private const val METHOD_PARSE_STRING = "parseString"
        private const val METHOD_PARSE_RAW_DATA = "parseRawData"
    }
}
