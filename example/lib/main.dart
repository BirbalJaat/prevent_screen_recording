import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:prevent_screen_recording/prevent_screen_recording.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  PreventScreenRecording? screenRecordingCallBack;
  String text = "Ready for recording";

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async{
    await initScreenRecordingCallback();
  }

  Future<void> initScreenRecordingCallback() async{
    screenRecordingCallBack = PreventScreenRecording();

    screenRecordingCallBack!.addListner(() {
      print("Updating status for recording...");

      setState(() {
        text = "Screenrecording callback received";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(text),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
