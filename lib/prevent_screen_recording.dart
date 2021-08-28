
import 'dart:async';

import 'package:flutter/services.dart';

class PreventScreenRecording {
  static const MethodChannel _channel =
      const MethodChannel('prevent_screen_recording');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
