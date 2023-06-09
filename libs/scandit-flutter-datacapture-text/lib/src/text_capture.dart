/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'text_capture_defaults.dart';
import 'text_capture_feedback.dart';
import 'text_capture_session.dart';
import 'text_capture_settings.dart';

abstract class TextCaptureListener {
  static const String _didCaptureEventName = "textCaptureListener-didCapture";

  void didCaptureText(TextCapture textCapture, TextCaptureSession session);
}

abstract class TextCaptureAdvancedListener {
  void didCaptureText(TextCapture textCapture, TextCaptureSession session, Future<FrameData> getFrameData());
}

class TextCapture extends DataCaptureMode {
  bool _enabled = true;

  bool _isInCallback = false;

  TextCaptureSettings _settings;

  final List<TextCaptureListener> _listeners = [];

  final List<TextCaptureAdvancedListener> _advancedListeners = [];

  TextCaptureFeedback _feedback = TextCaptureFeedback.defaultFeedback;

  late _TextCaptureListenerController _controller;

  TextCapture._(DataCaptureContext? context, this._settings) {
    _controller = _TextCaptureListenerController.forTextCapture(this);

    context?.addMode(this);
  }

  TextCapture.forContext(DataCaptureContext? context, TextCaptureSettings settings) : this._(context, settings);

  static CameraSettings get recommendedCameraSettings => _recommendedCameraSettings();

  static CameraSettings _recommendedCameraSettings() {
    var defaults = TextCaptureDefaults.cameraSettingsDefaults;
    return CameraSettings(defaults.preferredResolution, defaults.zoomFactor, defaults.focusRange,
        defaults.focusGestureStrategy, defaults.zoomGestureZoomFactor,
        shouldPreferSmoothAutoFocus: defaults.shouldPreferSmoothAutoFocus);
  }

  @override
  DataCaptureContext? get context => super.context;

  @override
  bool get isEnabled => _enabled;

  @override
  set isEnabled(bool newValue) {
    _enabled = newValue;
    if (_isInCallback) {
      return;
    }
    didChange();
  }

  TextCaptureFeedback get feedback => _feedback;

  set feedback(TextCaptureFeedback newValue) {
    _feedback = newValue;
    didChange();
  }

  void addListener(TextCaptureListener listener) {
    _checkAndSubscribeListeners();
    if (_listeners.contains(listener)) {
      return;
    }
    _listeners.add(listener);
  }

  void addAdvancedListener(TextCaptureAdvancedListener listener) {
    _checkAndSubscribeListeners();
    if (_advancedListeners.contains(listener)) {
      return;
    }
    _advancedListeners.add(listener);
  }

  void _checkAndSubscribeListeners() {
    if (_listeners.isEmpty && _advancedListeners.isEmpty) {
      _controller.subscribeListeners();
    }
  }

  void removeListener(TextCaptureListener listener) {
    _listeners.remove(listener);
    _checkAndUnsubscribeListeners();
  }

  void removeAdvancedListener(TextCaptureAdvancedListener listener) {
    _advancedListeners.remove(listener);
    _checkAndUnsubscribeListeners();
  }

  void _checkAndUnsubscribeListeners() {
    if (_listeners.isEmpty && _advancedListeners.isEmpty) {
      _controller.unsubscribeListeners();
    }
  }

  Future<void> applySettings(TextCaptureSettings settings) {
    _settings = settings;
    return didChange();
  }

  Future<void> didChange() {
    if (context != null) {
      return context!.update();
    }
    return Future.value();
  }

  @override
  Map<String, dynamic> toMap() {
    return {'type': 'textCapture', 'enabled': _enabled, 'feedback': _feedback.toMap(), 'settings': _settings.toMap()};
  }
}

class _TextCaptureListenerController {
  final EventChannel _eventChannel =
      const EventChannel('com.scandit.datacapture.text.capture.event/text_capture_listener');
  final MethodChannel _methodChannel =
      MethodChannel('com.scandit.datacapture.text.capture.method/text_capture_listener');
  final TextCapture _textCapture;
  StreamSubscription<dynamic>? _textCaptureSubscription;

  static const String _addTextCaptureListenerName = 'addTextCaptureListener';
  static const String _textCaptureFinishDidCaptureName = 'textCaptureFinishDidCapture';
  static const String _getLastFrameDataName = 'getLastFrameData';
  static const String _removeTextCaptureListenerName = 'removeTextCaptureListener';

  _TextCaptureListenerController.forTextCapture(this._textCapture);

  void subscribeListeners() {
    _methodChannel
        .invokeMethod(_addTextCaptureListenerName)
        .then((value) => _setupTextCaptureSubscription(), onError: _onError);
  }

  void _setupTextCaptureSubscription() {
    _textCaptureSubscription = _eventChannel.receiveBroadcastStream().listen((event) {
      if (_textCapture._listeners.isEmpty && _textCapture._advancedListeners.isEmpty) return;

      var eventJSON = jsonDecode(event);
      var session = TextCaptureSession.fromJSON(jsonDecode(eventJSON['session']));
      var eventName = eventJSON['event'] as String;
      if (eventName == TextCaptureListener._didCaptureEventName) {
        _notifyListenersOfDidCaptureText(session);
        _methodChannel
            .invokeMethod(_textCaptureFinishDidCaptureName, _textCapture.isEnabled)
            // ignore: unnecessary_lambdas
            .then((value) => null, onError: (error) => print(error));
      }
    });
  }

  void _notifyListenersOfDidCaptureText(TextCaptureSession session) {
    _textCapture._isInCallback = true;
    for (var listener in _textCapture._listeners) {
      listener.didCaptureText(_textCapture, session);
    }
    for (var listener in _textCapture._advancedListeners) {
      listener.didCaptureText(_textCapture, session, _getLastFrameData);
    }
    _textCapture._isInCallback = false;
  }

  Future<FrameData> _getLastFrameData() {
    return _methodChannel
        .invokeMethod(_getLastFrameDataName)
        .then((value) => getFrom(value as String), onError: _onError);
  }

  DefaultFrameData getFrom(String response) {
    final decoded = jsonDecode(response);
    return DefaultFrameData.fromJSON(decoded);
  }

  void unsubscribeListeners() {
    _textCaptureSubscription?.cancel();
    _methodChannel.invokeMethod(_removeTextCaptureListenerName).then((value) => null, onError: _onError);
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
