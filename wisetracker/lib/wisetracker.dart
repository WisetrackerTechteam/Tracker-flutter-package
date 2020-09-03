
import 'dart:async';

import 'package:flutter/services.dart';

class Wisetracker {
  static const MethodChannel _channel =
      const MethodChannel('wisetracker');

    static Future<String> get platformVersion async {
      final String version = await _channel.invokeMethod('getPlatformVersion');
      print(version);
      return version;
    }

    static void get testFunction async {
      await _channel.invokeMethod('testFunction');
    }

    static void init(String appKey) async {
      _channel.invokeMethod('init', <String, dynamic>{'appKey': appKey});
    }

    static void get sendTransaction async {
      _channel.invokeMethod('sendTransaction');
    }

    static void setProduct(String productName, String productCode) async {
      _channel.invokeMethod('setProduct', <String, dynamic>{
        'productCode': productCode,
        'productName': productName,
      });
    }

}
