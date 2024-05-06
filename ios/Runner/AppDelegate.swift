import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let changeIconChannel = FlutterMethodChannel(name: "com.example.learn_multi_ic_launcher/changeIcon",
                                                 binaryMessenger: controller.binaryMessenger)
    changeIconChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      guard call.method == "changeIcon" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self.changeIcon(call: call, result: result)
    })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func changeIcon(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let args = call.arguments else {
      return
    }
    if let myArgs = args as? [String: Any],
       let iconName = myArgs["aliasName"] as? String {
      if iconName == "AppIcon" {
        UIApplication.shared.setAlternateIconName(nil) { error in
          if let error = error {
            result("Failed to set icon: \(error)")
          } else {
            result("Icon set successfully")
          }
        }
      } else {
        UIApplication.shared.setAlternateIconName(iconName) { error in
          if let error = error {
            result("Failed to set icon: \(error)")
          } else {
            result("Icon set successfully")
          }
        }
      }
    }
  }
}
