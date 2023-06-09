/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import Foundation
import scandit_flutter_datacapture_core
import ScanditTextCapture

extension ScanditFlutterDataCaptureText {
    func registerDeserializer() {
        let textDeserializer = TextCaptureDeserializer()
        textDeserializer.delegate = self
        ScanditFlutterDataCaptureCore.register(modeDeserializer: textDeserializer)
    }
}

extension ScanditFlutterDataCaptureText: TextCaptureDeserializerDelegate {
    public func textCaptureDeserializer(_ deserializer: TextCaptureDeserializer,
                                        didStartDeserializingMode mode: TextCapture,
                                        from jsonValue: JSONValue) {
        // not used in frameworks
    }

    public func textCaptureDeserializer(_ deserializer: TextCaptureDeserializer,
                                        didFinishDeserializingMode mode: TextCapture,
                                        from jsonValue: JSONValue) {
        if jsonValue.containsKey("enabled") {
            mode.isEnabled = jsonValue.bool(forKey: "enabled")
        }
        textCapture = mode
    }

    public func textCaptureDeserializer(_ deserializer: TextCaptureDeserializer,
                                        didStartDeserializingSettings settings: TextCaptureSettings,
                                        from jsonValue: JSONValue) {
        // not used in frameworks
    }

    public func textCaptureDeserializer(_ deserializer: TextCaptureDeserializer,
                                        didFinishDeserializingSettings settings: TextCaptureSettings,
                                        from jsonValue: JSONValue) {
        // not used in frameworks
    }

    public func textCaptureDeserializer(_ deserializer: TextCaptureDeserializer,
                                        didStartDeserializingOverlay overlay: TextCaptureOverlay,
                                        from jsonValue: JSONValue) {
        // not used in frameworks
    }

    public func textCaptureDeserializer(_ deserializer: TextCaptureDeserializer,
                                        didFinishDeserializingOverlay overlay: TextCaptureOverlay,
                                        from jsonValue: JSONValue) {
        // not used in frameworks
    }
}
