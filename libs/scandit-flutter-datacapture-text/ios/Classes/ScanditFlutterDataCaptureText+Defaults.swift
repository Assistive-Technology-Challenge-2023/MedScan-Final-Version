/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import Foundation
import scandit_flutter_datacapture_core
import ScanditTextCapture

extension ScanditFlutterDataCaptureText {
    var defaults: [String: Any] {
        do {
            let settings = try TextCaptureSettings(jsonString: "{}")
            return [
                "RecommendedCameraSettings": TextCapture.recommendedCameraSettings.defaults,
                "TextCaptureOverlay": [
                    "Brush": TextCaptureOverlay.defaultBrush.defaults
                ],
                "TextCaptureSettings": [
                    "recognitionDirection": settings.recognitionDirection.jsonString,
                    "duplicateFilter": Int(settings.duplicateFilter * 1000)
                ]
            ]
        } catch {
            print(error)
            return [:]
        }
    }
}
