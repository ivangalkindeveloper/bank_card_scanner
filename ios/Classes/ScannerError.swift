import Foundation

enum ScannerError: Error {
    case noCamera
    case alreadyStarted
    case alreadyStopped
    case torchError(_ error: Error)
    case cameraError(_ error: Error)
    case torchWhenStopped
    case zoomWhenStopped
    case zoomError(_ error: Error)
    case analyzerError(_ error: Error)
}
