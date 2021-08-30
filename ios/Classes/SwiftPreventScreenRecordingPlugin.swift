import Flutter
import UIKit

public class SwiftPreventScreenRecordingPlugin: NSObject, FlutterPlugin {
    static var channel: FlutterMethodChannel?

    static var observer: NSObjectProtocol?;

  public static func register(with registrar: FlutterPluginRegistrar) {
    channel = FlutterMethodChannel(name: "prevent_screen_recording",
    binaryMessenger: registrar.messenger())
    observer = nil;
    let instance = SwiftPreventScreenRecordingPlugin()

    if let channel = channel{
    registrar.addMethodCallDelegate(instance, channel: channel)
    }

  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "initialize"){
     if(SwiftPreventScreenRecordingPlugin.observer != nil){
    NotificationCenter.default.removeObserver(SwiftPreventScreenRecordingPlugin.observer);
    SwiftPreventScreenRecordingPlugin.observer = nil;
    }
        if #available(iOS 11.0, *) {
            SwiftPreventScreenRecordingPlugin.observer =
                NotificationCenter.default.addObserver(
                    forName: UIScreen.capturedDidChangeNotification ,
                    object: nil, queue: .main){ notification in

                    if let channel = SwiftPreventScreenRecordingPlugin.channel {
                        channel.invokeMethod("onCallback", arguments: nil)
                    }

                    result("screen recoring called")

                }
        } else {
            // Fallback on earlier versions
        }
    result("initialize")

    } else if(call.method == "dispose"){

    if(SwiftPreventScreenRecordingPlugin.observer != nil){
    NotificationCenter.default.removeObserver(SwiftPreventScreenRecordingPlugin.observer!);
    SwiftPreventScreenRecordingPlugin.observer =  nil;
    }
    result("dispose")
    }else{
    result("")
    }

  }

  deinit{
  if(SwiftPreventScreenRecordingPlugin.observer != nil){
  NotificationCenter.default.removeObserver(SwiftPreventScreenRecordingPlugin.observer!);
  SwiftPreventScreenRecordingPlugin.observer = nil;
  }

  }
}
