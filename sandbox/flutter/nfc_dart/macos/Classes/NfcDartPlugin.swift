import Cocoa
import FlutterMacOS
import CryptoTokenKit

public class NfcDartPlugin: NSObject, FlutterPlugin {
    let manager = TKSmartCardSlotManager.default
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "nfc_dart", binaryMessenger: registrar.messenger)
        let instance = NfcDartPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        print(call.method)
        switch call.method {
            case "getPlatformVersion":
                result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
            case "loadCardReader":
                loadCardReader(result)
            case "loadNFC":
                loadNFC(result)
            default:
                result(FlutterMethodNotImplemented)
        }
    }
    
    public func loadCardReader(_ result: FlutterResult) {
        print("start loadCardReader.")
        let slotNames = manager?.slotNames
        if slotNames == nil {
            print("is null")
            result([])
            return
        }
        result(slotNames)
    }
    
    public func loadNFC(_ result: FlutterResult) {
        let slotNames = manager?.slotNames
        if slotNames == nil {
            print("is null")
            return
        }
        for name in slotNames!.enumerated() {
            print("\(name)")
        }
        result(nil)
    }
}
