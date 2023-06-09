/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

package com.scandit.datacapture.flutter.text.data.defaults

import com.scandit.datacapture.flutter.core.data.SerializableData
import com.scandit.datacapture.flutter.core.data.defaults.SerializableCameraSettingsDefaults
import com.scandit.datacapture.text.capture.TextCapture
import com.scandit.datacapture.text.capture.TextCaptureSettings
import com.scandit.datacapture.text.ui.TextCaptureOverlay
import org.json.JSONObject

class SerializableTextCaptureDefaults(
    private val recommendedCameraSettings: SerializableCameraSettingsDefaults,
    private val textCaptureOverlayDefaults: SerializableTextCaptureOverlayDefaults,
    private val textCaptureSettingsDefaults: SerializableTextCaptureSettingsDefaults
) : SerializableData {

    override fun toJson(): JSONObject = JSONObject(
        mapOf(
            FIELD_RECOMMENDED_CAMERA_SETTINGS to recommendedCameraSettings.toJson(),
            FIELD_TEXT_CAPTURE_OVERLAY to textCaptureOverlayDefaults.toJson(),
            FIELD_TEXT_CAPTURE_SETTINGS to textCaptureSettingsDefaults.toJson()
        )
    )

    companion object {
        private const val FIELD_RECOMMENDED_CAMERA_SETTINGS = "RecommendedCameraSettings"
        private const val FIELD_TEXT_CAPTURE_OVERLAY = "TextCaptureOverlay"
        private const val FIELD_TEXT_CAPTURE_SETTINGS = "TextCaptureSettings"

        @JvmStatic
        fun createDefaults(): String {
            return SerializableTextCaptureDefaults(
                SerializableCameraSettingsDefaults(
                    TextCapture.createRecommendedCameraSettings()
                ),
                SerializableTextCaptureOverlayDefaults(TextCaptureOverlay.defaultBrush()),
                SerializableTextCaptureSettingsDefaults(TextCaptureSettings.fromJson("{}"))
            ).toJson().toString()
        }
    }
}
