import 'dart:async';

import 'package:flutter/services.dart';

class Myfirstplugin {
  static const MethodChannel _channel = const MethodChannel('myfirstplugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> getCustomData(dynamic data) async {
    final String response = await _channel
        .invokeMethod('getCustomData', <String, dynamic>{'query': data});
    return response;
  }
}
