#import "PreventScreenRecordingPlugin.h"
#if __has_include(<prevent_screen_recording/prevent_screen_recording-Swift.h>)
#import <prevent_screen_recording/prevent_screen_recording-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "prevent_screen_recording-Swift.h"
#endif

@implementation PreventScreenRecordingPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPreventScreenRecordingPlugin registerWithRegistrar:registrar];
}
@end
