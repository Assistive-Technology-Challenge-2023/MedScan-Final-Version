/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'text_capture_defaults.dart';

// ignore: avoid_classes_with_only_static_members
class ScanditFlutterDataCaptureText {
  static Future<void> initialize() async {
    await ScanditFlutterDataCaptureCore.initialize();
    await TextCaptureDefaults.initializeDefaults();
  }
}
