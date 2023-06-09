/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

package com.scandit.datacapture.flutter.text.data.defaults

import com.scandit.datacapture.core.common.toJson
import com.scandit.datacapture.flutter.core.data.SerializableData
import com.scandit.datacapture.text.capture.TextCaptureSettings
import org.json.JSONObject

class SerializableTextCaptureSettingsDefaults(
    private val settings: TextCaptureSettings
) : SerializableData {

    override fun toJson(): JSONObject = JSONObject(
        mapOf(
            FIELD_DEFAULT_RECOGNITION_DIRECTION to settings.recognitionDirection.toJson(),
            FIELD_DEFAULT_DUPLICATE_FILTER to settings.duplicateFilter.asMillis().toInt()
        )
    )

    companion object {
        private const val FIELD_DEFAULT_RECOGNITION_DIRECTION = "recognitionDirection"
        private const val FIELD_DEFAULT_DUPLICATE_FILTER = "duplicateFilter"
    }
}
