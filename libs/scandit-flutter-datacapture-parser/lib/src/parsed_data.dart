/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'parsed_field.dart';

class ParsedData {
  final String _jsonString;
  String get jsonString => _jsonString;

  final List<ParsedField> _fields;
  List<ParsedField> get fields => _fields;

  final Map<String, ParsedField> _fieldsByName;
  Map<String, ParsedField> get fieldsByName => _fieldsByName;

  ParsedData._(this._jsonString, this._fields, this._fieldsByName);

  factory ParsedData.fromJSON(List<Map<String, dynamic>> json) {
    var jsonString = jsonEncode(json);
    var fields = json.map((e) => ParsedField.fromJSON(e)).toList();
    var fieldsByName = Map<String, ParsedField>.fromIterable(fields,
        key: (element) => (element as ParsedField).name, value: (element) => element as ParsedField);
    return ParsedData._(jsonString, fields, fieldsByName);
  }
}
