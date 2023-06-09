/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

package com.scandit.datacapture.flutter.text.data.defaults

import com.scandit.datacapture.core.ui.style.Brush
import com.scandit.datacapture.flutter.core.data.SerializableData
import com.scandit.datacapture.flutter.core.data.defaults.SerializableBrushDefaults
import org.json.JSONObject

class SerializableTextCaptureOverlayDefaults(
    private val defaultBrush: Brush
) : SerializableData {

    override fun toJson(): JSONObject = JSONObject(
        mapOf(
            FIELD_DEFAULT_TEXT_BRUSH to SerializableBrushDefaults(defaultBrush).toJson()
        )
    )

    companion object {
        private const val FIELD_DEFAULT_TEXT_BRUSH = "Brush"
    }
}
