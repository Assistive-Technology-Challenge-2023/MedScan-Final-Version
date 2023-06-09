/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

class ParsedField {
  final String _name;
  String get name => _name;

  final dynamic _parsed;
  dynamic get parsed => _parsed;

  final String _rawString;
  String get rawString => _rawString;

  final List<String> _issues;
  List<String> get issues => _issues;

  ParsedField._(this._name, this._parsed, this._rawString, this._issues);

  factory ParsedField.fromJSON(Map<String, dynamic> json) {
    var issues = <String>[];
    if (json.containsKey('issues') && json["issues"] != null) {
      issues.addAll(json['issues'] as List<String>);
    }
    return ParsedField._(json['name'], json['parsed'], json['rawString'], issues);
  }
}
