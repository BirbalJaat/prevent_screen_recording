<h1 align="center">Prevent Screen Recording iOS</h1>
<h4 align="center">
  Flutter plugin that allows you to detect mobile recording and execute callback functions on iOS 🚀
</h4>

<p align="center">
  <a href="#usage">Usage</a> •
  <a href="#issues-and-feedback">Issues and Feedback</a> •
  <a href="#author">Author</a> •
  <a href="#license">License</a>
</p>

> [Feedback welcome](https://github.com/BirbalJaat/prevent_screen_recording/issues) and [Pull Requests](https://github.com/BirbalJaat/prevent_screen_recording/pulls) are most welcome!

## Usage

### Import the package

To use this plugin, follow the [**plugin installation instructions**](https://pub.dev/packages/prevent_screen_recording/install).

### Use the plugin

Add the following import to your Dart code:

```dart
import 'package:prevent_screen_recording/prevent_screen_recording.dart';
```

Initialize PreventScreenRecording with the scopes you want:

```dart
PreventScreenRecording preventScreenRecording = PreventScreenRecording();
```

### addListner

Then invoke <code>addListner</code> method of <code>PreventScreenRecording</code>.
Add custom functions that you want to excute after detect recording. e.g:

```dart
preventScreenRecording.addListner(() {
  //Void funtions are implemented
  print('detect recording...');
});
```

### dispose

You need to call <code>dispose</code> method to terminate <code>PreventScreenRecording</code> before you exit the app e.g:

```dart
preventScreenRecording.dispose();
```

## Issues and Feedback

Please [**file**](https://github.com/BirbalJaat/prevent_screen_recording/issues) issues to send feedback or report a bug. Thank you !



## License

MIT
