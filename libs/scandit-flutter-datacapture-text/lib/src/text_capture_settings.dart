/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'text_capture_defaults.dart';

class TextCaptureSettings implements Serializable {
  final Map<String, dynamic> _properties = {};
  final Map<String, dynamic> _textRecognizerSettings = {};

  Direction recognitionDirection = TextCaptureDefaults.textCaptureSettingsDefaults.recognitionDirection;

  Duration duplicateFilter = Duration(milliseconds: TextCaptureDefaults.textCaptureSettingsDefaults.duplicateFilter);

  LocationSelection? locationSelection;

  void setProperty<T>(String name, T value) {
    _properties[name] = value;
  }

  T getProperty<T>(String name) {
    return _properties[name] as T;
  }

  static TextCaptureSettings fromJSON(Map<String, dynamic> json) {
    var settings = TextCaptureSettings();

    for (var entry in json.entries) {
      settings._textRecognizerSettings[entry.key] = entry.value;
    }

    return settings;
  }

  @override
  Map<String, dynamic> toMap() {
    var json = {
      'duplicateFilter': duplicateFilter.inMilliseconds,
      'recognitionDirection': recognitionDirection.jsonValue,
      'locationSelection': locationSelection == null ? {'type': 'none'} : locationSelection?.toMap(),
      'properties': _properties
    };
    json.addAll(_textRecognizerSettings);
    return json;
  }
}
