/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import Foundation

enum ScanditFlutterDataCaptureTextEvent: String, CaseIterable {
    case didCaptureText = "textCaptureListener-didCapture"
}

extension ScanditFlutterDataCaptureText {
    @discardableResult
    func send(_ event: ScanditFlutterDataCaptureTextEvent, body: [String: Any]) -> Bool {
        guard let sink = eventSink, hasListeners else { return false }
        let payload = ["event": event.rawValue].merging(body) { _, new in new }
        do {
            let jsonString = String(data: try JSONSerialization.data(withJSONObject: payload,
                                                                     options: []),
                                    encoding: .utf8)
            sink(jsonString)
            return true
        } catch {
            print(error)
            return false
        }
    }
}
