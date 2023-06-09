/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

// ignore: avoid_classes_with_only_static_members
class TextCaptureDefaults {
  static bool _isInitialized = false;
  static MethodChannel channel = MethodChannel("com.scandit.datacapture.text.capture.method/text_capture_defaults");
  static late CameraSettingsDefaults _cameraSettingsDefaults;
  static late TextCaptureOverlayDefaults _textCaptureOverlayDefaults;
  static late TextCaptureSettingsDefaults _textCaptureSettingsDefaults;

  static CameraSettingsDefaults get cameraSettingsDefaults => _cameraSettingsDefaults;

  static TextCaptureOverlayDefaults get textCaptureOverlayDefaults => _textCaptureOverlayDefaults;

  static TextCaptureSettingsDefaults get textCaptureSettingsDefaults => _textCaptureSettingsDefaults;

  static Future<void> initializeDefaults() async {
    if (_isInitialized) return;
    var result = await channel.invokeMethod("getDefaults");
    var json = jsonDecode(result as String);

    _cameraSettingsDefaults = CameraSettingsDefaults.fromJSON(json["RecommendedCameraSettings"]);
    _textCaptureOverlayDefaults = TextCaptureOverlayDefaults.fromJSON(json["TextCaptureOverlay"]);
    _textCaptureSettingsDefaults = TextCaptureSettingsDefaults.fromJSON(json["TextCaptureSettings"]);

    _isInitialized = true;
  }
}

class TextCaptureOverlayDefaults {
  final Brush defaultBrush;

  TextCaptureOverlayDefaults(this.defaultBrush);

  factory TextCaptureOverlayDefaults.fromJSON(Map<String, dynamic> json) {
    return TextCaptureOverlayDefaults(BrushDefaults.fromJSON(json["Brush"] as Map<String, dynamic>).toBrush());
  }
}

class TextCaptureSettingsDefaults {
  final int duplicateFilter;
  final Direction recognitionDirection;

  TextCaptureSettingsDefaults(this.duplicateFilter, this.recognitionDirection);

  factory TextCaptureSettingsDefaults.fromJSON(Map<String, dynamic> json) {
    return TextCaptureSettingsDefaults(
        json["duplicateFilter"] as int, DirectionDeserializer.fromJSON(json["recognitionDirection"] as String));
  }
}
