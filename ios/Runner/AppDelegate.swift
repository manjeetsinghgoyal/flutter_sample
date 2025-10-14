import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "com.example.battery",
                                              binaryMessenger: controller.binaryMessenger)

    batteryChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "getBatteryLevel" {
        let level = self.getBatteryLevel()
        if level == -1 {
          result(FlutterError(code: "UNAVAILABLE",
                              message: "Battery level not available.",
                              details: nil))
        } else {
          result(level)
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func getBatteryLevel() -> Int {
    UIDevice.current.isBatteryMonitoringEnabled = true
    if UIDevice.current.batteryState == UIDevice.BatteryState.unknown {
      return -1
    } else {
      return Int(UIDevice.current.batteryLevel * 100)
    }
  }
}
