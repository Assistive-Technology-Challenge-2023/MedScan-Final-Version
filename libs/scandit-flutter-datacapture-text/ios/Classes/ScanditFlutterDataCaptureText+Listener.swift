/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import ScanditTextCapture
import scandit_flutter_datacapture_core

extension ScanditFlutterDataCaptureText: TextCaptureListener {
    public func textCapture(_ textCapture: TextCapture,
                            didCaptureIn session: TextCaptureSession,
                            frameData: FrameData) {
        ScanditFlutterDataCaptureCore.lastFrame = frameData
        guard let value = textCaptureLock.wait(afterDoing: {
            return send(.didCaptureText, body: ["session": session.jsonString])
        }) else { return }
        self.textCapture?.isEnabled = value
        ScanditFlutterDataCaptureCore.lastFrame = nil
    }
}

extension ScanditFlutterDataCaptureText: FlutterStreamHandler {
    public func onListen(withArguments arguments: Any?,
                         eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        return nil
    }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }
}
