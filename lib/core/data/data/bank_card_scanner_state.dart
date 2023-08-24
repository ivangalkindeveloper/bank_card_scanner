import 'package:bank_card_scanner/core/data/data/camera_direction.dart';

class BankCardScannerState {
  const BankCardScannerState({
    this.isInitialized = false,
    this.isStarted = false,
    this.cameraDirection = CameraDirection.back,
    this.textureId,
    this.lastFrameDecoded,
    this.hasFlashlight = false,
    this.isOnFlashlight = false,
    this.isDisposed = false,
  });

  final bool isInitialized;
  final bool isStarted;
  final CameraDirection cameraDirection;
  final int? textureId;
  final DateTime? lastFrameDecoded;
  final bool hasFlashlight;
  final bool isOnFlashlight;
  final bool isDisposed;

  BankCardScannerState copyWith({
    bool? isInitialized,
    bool? isStarted,
    CameraDirection? cameraDirection,
    int? textureId,
    DateTime? lastFrameDecoded,
    bool? hasFlashlight,
    bool? isOnFlashlight,
    bool? isDisposed,
  }) =>
      BankCardScannerState(
        isInitialized: isInitialized ?? this.isInitialized,
        isStarted: isStarted ?? this.isStarted,
        cameraDirection: cameraDirection ?? this.cameraDirection,
        textureId: textureId ?? this.textureId,
        lastFrameDecoded: lastFrameDecoded ?? this.lastFrameDecoded,
        hasFlashlight: hasFlashlight ?? this.hasFlashlight,
        isOnFlashlight: isOnFlashlight ?? this.isOnFlashlight,
        isDisposed: isDisposed ?? this.isDisposed,
      );
}
