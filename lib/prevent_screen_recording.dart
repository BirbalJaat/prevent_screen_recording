
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PreventScreenRecording {
  static const MethodChannel _channel =
  const MethodChannel('prevent_screen_recording');

  List<VoidCallback> onCallbacks = <VoidCallback>[];

  bool? requestPermissions;

  PreventScreenRecording(){
    initialize();
  }

  Future<void> initialize() async{

    _channel.setMethodCallHandler(_handleCapture);
    await _channel.invokeMethod("initialize");

  }

  void addListner(VoidCallback callback){
    assert(callback != null, 'A non-null callback must be provided');
    onCallbacks.add(callback);
  }

  Future<dynamic> _handleCapture(MethodCall call) async{
    switch(call.method){
      case 'onCallback':
        print("oncallback received");
        for(final callback in onCallbacks){
          callback();
        }
        break;
      default:
        throw("method not defined");
    }
  }

  Future<void> dispose() async{
    await _channel.invokeMethod("dispose");
  }



}
