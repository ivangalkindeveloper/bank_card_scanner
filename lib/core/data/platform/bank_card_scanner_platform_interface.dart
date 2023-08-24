import 'package:bank_card_scanner/core/data/platform/bank_card_scanner_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:bank_card_scanner/core/data/data/camera_direction.dart';

abstract class BankCardScannerPlatform extends PlatformInterface {
  /// Constructs a BankCardScannerPlatform.
  BankCardScannerPlatform() : super(token: _token);

  static final Object _token = Object();

  static BankCardScannerPlatform _instance = BankCardScannerMethodChannel();

  /// The default instance of [BankCardScannerPlatform] to use.
  ///
  /// Defaults to [MethodChannelBankCardScanner].
  static BankCardScannerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BankCardScannerPlatform] when
  /// they register themselves.
  static set instance(BankCardScannerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() =>
      throw UnimplementedError('platformVersion() has not been implemented.');

  Future<void> resume() =>
      throw UnimplementedError('resume() has not been implemented.');

  Future<void> pause() =>
      throw UnimplementedError('pause() has not been implemented.');

  Future<void> switchCamera({
    required CameraDirection direction,
  }) =>
      throw UnimplementedError('switchCamera() has not been implemented.');

  Future<void> switchFlashlight({
    required bool isOnFlashlight,
  }) =>
      throw UnimplementedError('switchFlashlight() has not been implemented.');
}
