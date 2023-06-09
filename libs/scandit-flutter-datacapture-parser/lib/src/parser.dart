/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'function_names.dart';
import 'parsed_data.dart';
import 'parser_dataformat.dart';

class Parser extends DataCaptureComponent implements Serializable {
  String get id => super.id;

  late _ParserController _controller;

  late ParserDataFormat _dataFormat;

  final Map<String, dynamic> _options = {};

  late DataCaptureContext _context;

  static Future<Parser> forContextAndFormat(DataCaptureContext context, ParserDataFormat dataFormat) {
    var parser = Parser._();
    parser._dataFormat = dataFormat;
    parser._context = context;
    var future = context.addComponent(parser).then((_) => parser);
    return future;
  }

  Future<void> setOptions(Map<String, dynamic> options) {
    _options.clear();
    _options.addAll(options);
    return _context.update();
  }

  Future<ParsedData> parseString(String data) {
    return _controller.parseString(data);
  }

  Future<ParsedData> parseRawData(String data) {
    return _controller.parseRawData(data);
  }

  Parser._() : super(DateTime.now().toUtc().millisecondsSinceEpoch.toString()) {
    _controller = _ParserController(this);
  }

  @override
  Map<String, dynamic> toMap() {
    var json = super.toMap();
    json.addAll({'type': 'parser', 'dataFormat': _dataFormat.jsonValue, 'options': _options});
    return json;
  }
}

class _ParserController {
  final Parser _parser;

  final MethodChannel _methodChannel = MethodChannel('com.scandit.datacapture.parser.method/parser');

  _ParserController(this._parser);

  Future<ParsedData> parseString(String data) {
    var arguments = _createParserInvocationArgs(data);
    return _methodChannel
        .invokeMethod(FunctionNames.parseStringMethodName, arguments)
        .then(_parseData, onError: _onError);
  }

  Future<ParsedData> parseRawData(String data) {
    var arguments = _createParserInvocationArgs(data);
    return _methodChannel
        .invokeMethod(FunctionNames.parseRawDataMethodName, arguments)
        .then(_parseData, onError: _onError);
  }

  Map<String, dynamic> _createParserInvocationArgs(String data) {
    return {'parserId': _parser.id, 'data': data};
  }

  FutureOr<ParsedData> _parseData(dynamic result) {
    var jsonData = jsonDecode(result) as List<dynamic>;
    var json = jsonData.cast<Map<String, dynamic>>();
    var parsedData = ParsedData.fromJSON(json);
    return parsedData;
  }

  void _onError(Object? error, StackTrace? stackTrace) {
    if (error == null) return;
    print(error);

    if (stackTrace != null) {
      print(stackTrace);
    }

    throw error;
  }
}
