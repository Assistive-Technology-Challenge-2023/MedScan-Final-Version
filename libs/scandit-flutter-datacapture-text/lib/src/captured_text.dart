/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

class CapturedText {
  final String _value;

  String get value {
    return _value;
  }

  final Quadrilateral _location;

  Quadrilateral get location {
    return _location;
  }

  CapturedText._(this._location, this._value);

  CapturedText.fromJSON(Map<String, dynamic> json)
      : this._(Quadrilateral.fromJSON(json['location']), json['value'] as String);
}
