import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prevent_screen_recording/prevent_screen_recording.dart';

void main() {
  const MethodChannel channel = MethodChannel('prevent_screen_recording');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await PreventScreenRecording.platformVersion, '42');
  });
}
