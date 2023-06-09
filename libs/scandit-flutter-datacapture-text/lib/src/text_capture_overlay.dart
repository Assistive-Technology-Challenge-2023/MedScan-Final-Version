/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'text_capture.dart';
import 'text_capture_defaults.dart';

class TextCaptureOverlay extends DataCaptureOverlay {
  TextCapture _textCapture;

  Brush _brush = defaultBrush;

  @override
  DataCaptureView? view;

  TextCaptureOverlay._(this._textCapture, this.view) : super('textCapture') {
    view?.addOverlay(this);
  }

  TextCaptureOverlay.withTextCapture(TextCapture textCapture) : this.withTextCaptureForView(textCapture, null);

  TextCaptureOverlay.withTextCaptureForView(TextCapture textCapture, DataCaptureView? view) : this._(textCapture, view);

  static Brush get defaultBrush {
    return TextCaptureDefaults.textCaptureOverlayDefaults.defaultBrush;
  }

  Brush get brush => _brush;

  set brush(Brush newValue) {
    _brush = newValue;
    _textCapture.didChange();
  }

  bool _shouldShowScanAreaGuides = false;

  bool get shouldShowScanAreaGuides => _shouldShowScanAreaGuides;

  set shouldShowScanAreaGuides(bool newValue) {
    _shouldShowScanAreaGuides = newValue;
    _textCapture.didChange();
  }

  Viewfinder? _viewfinder;

  Viewfinder? get viewfinder => _viewfinder;

  set viewfinder(Viewfinder? newValue) {
    _viewfinder = newValue;
    _textCapture.didChange();
  }

  @override
  Map<String, dynamic> toMap() {
    var json = super.toMap();
    json.addAll({
      'brush': _brush.toMap(),
      'shouldShowScanAreaGuides': _shouldShowScanAreaGuides,
      'viewfinder': _viewfinder == null ? {'type': 'none'} : _viewfinder?.toMap()
    });
    return json;
  }
}
