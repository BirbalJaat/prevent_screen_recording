Prevent Screen Recording in iOS Flutter App
Flutter plugin that allows you to detect mobile recording and execute callback functions on iOS . 🚀
 
Usage

Feedback welcome and Pull Requests are most welcome!

Usage
Import the package
To use this plugin, follow the plugin installation instructions.

Use the plugin
Add the following import to your Dart code:

import 'package:prevent_screen_recording/prevent_screen_recording.dart';

Initialize PreventScreenRecording with the scopes you want:

PreventScreenRecording preventScreenRecording = PreventScreenRecording();

addListner
Then invoke addListner method of preventScreenRecording. Add custom functions that you want to excute after detect recording. e.g:

preventScreenRecording.addListner(() {
  //Void funtions are implemented
  print('detect recording');
});
dispose
You need to call dispose method to terminate PreventScreenRecording before you exit the app e.g:

preventScreenRecording.dispose();
