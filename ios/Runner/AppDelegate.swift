import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    guard let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "ProformaBackup") else {
      return
    }
    let channel = FlutterMethodChannel(
      name: "proforma/backup",
      binaryMessenger: registrar.messenger()
    )
    channel.setMethodCallHandler { (call, result) in
      guard call.method == "excludeFromBackup" else {
        result(FlutterMethodNotImplemented)
        return
      }
      guard let path = call.arguments as? String else {
        result(FlutterError(code: "INVALID", message: "Expected file path string", details: nil))
        return
      }
      var url = URL(fileURLWithPath: path)
      var vals = URLResourceValues()
      vals.isExcludedFromBackup = true
      do {
        try url.setResourceValues(vals)
        result(true)
      } catch {
        result(FlutterError(code: "FAILED", message: error.localizedDescription, details: nil))
      }
    }
  }
}
