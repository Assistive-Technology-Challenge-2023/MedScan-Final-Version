/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'captured_text.dart';

class TextCaptureSession {
  final List<CapturedText> _newlyCapturedTexts;

  final int _frameSequenceId;

  List<CapturedText> get newlyCapturedTexts {
    return _newlyCapturedTexts;
  }

  int get frameSequenceId {
    return _frameSequenceId;
  }

  TextCaptureSession._(this._frameSequenceId, this._newlyCapturedTexts);

  TextCaptureSession.fromJSON(Map<String, dynamic> json)
      : this._(
            json['frameSequenceId'] as int,
            (json['newlyCapturedTexts'] as List<dynamic>)
                .cast<Map<String, dynamic>>()
                .map((e) => CapturedText.fromJSON(e))
                .toList()
                .cast<CapturedText>());
}
