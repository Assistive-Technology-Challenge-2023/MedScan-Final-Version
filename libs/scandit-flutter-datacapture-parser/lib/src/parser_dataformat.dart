/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum ParserDataFormat {
  gs1Ai,
  hibc,
  dlid,
  mrtd,
  swissQr,
  vin,
  usUsid,
}

extension ParserDataFormatDeserializer on ParserDataFormat {
  String get jsonValue => _jsonValue();

  String _jsonValue() {
    switch (this) {
      case ParserDataFormat.gs1Ai:
        return 'gs1ai';
      case ParserDataFormat.hibc:
        return 'hibc';
      case ParserDataFormat.dlid:
        return 'dlid';
      case ParserDataFormat.mrtd:
        return 'mrtd';
      case ParserDataFormat.swissQr:
        return 'swissQr';
      case ParserDataFormat.vin:
        return 'vin';
      case ParserDataFormat.usUsid:
        return 'usUsid';
      default:
        throw Exception("Missing Json Value for '$this' parser data format.");
    }
  }
}
