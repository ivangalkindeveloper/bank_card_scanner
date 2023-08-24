import Flutter
import MLKitVision
import MLKitBarcodeScanning
import AVFoundation
import UIKit

public class BankCardScannerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bank_card_scanner", binaryMessenger: registrar.messenger())
    let instance = BankCardScannerPlugin(registry: registrar.textures())
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  private let scanner: Scanner

  init(registry: FlutterTextureRegistry) {
        self.scanner = Scanner(registry: registry,
          scannerCallback: { image, error in },
          torchCallback: { torchState in },
          zoomCallback: { zoomState in }
        )
        super.init()
    }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "initialize":
      initialize(call, result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func initialize(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let returnImage: Bool = false
        let position = AVCaptureDevice.Position.back

        do {
            try scanner.start(returnImage: returnImage, cameraPosition: position, torch: .off) { parameters in
                result(parameters.textureId)
            }
        } catch ScannerError.alreadyStarted {
            result(FlutterError(code: "Scanner",
                                message: "Called start() while already started!",
                                details: nil))
        } catch ScannerError.noCamera {
            result(FlutterError(code: "Scanner",
                                message: "No camera found or failed to open camera!",
                                details: nil))
        } catch ScannerError.torchError(let error) {
            result(FlutterError(code: "Scanner",
                                message: "Error occured when setting torch!",
                                details: error))
        } catch ScannerError.cameraError(let error) {
            result(FlutterError(code: "Scanner",
                                message: "Error occured when setting up camera!",
                                details: error))
        } catch {
            result(FlutterError(code: "Scanner",
                                message: "Unknown error occured..",
                                details: nil))
        }
    }
}
