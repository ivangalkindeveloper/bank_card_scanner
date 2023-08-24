import 'package:bank_card_scanner/core/data/platform/bank_card_scanner_platform_interface.dart';
import 'package:bank_card_scanner/core/data/platform/bank_card_scanner_method_channel.dart';
import 'package:bank_card_scanner/core/data/data/bank_card_scanner_exception.dart';
import 'package:bank_card_scanner/core/data/data/bank_card_scanner_state.dart';
import 'package:bank_card_scanner/core/domain/bank_card_scan_result.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class BankCardScannerController extends ValueNotifier<BankCardScannerState> {
  BankCardScannerController({
    required this.onScan,
    this.delay = const Duration(milliseconds: 400),
    this.isOneScanningMode = false,
  }) : super(
          const BankCardScannerState(),
        );

  final Function(BankCardScanResult result) onScan;
  final Duration delay;
  final bool isOneScanningMode;

  final BankCardScannerMethodChannel _methodChannel =
      BankCardScannerMethodChannel(
    onFlashlightState: () {},
    onFrame: () {},
  );

  Future<void> initialize() async {
    //TODO Init logic

    final int? textureId = await this._methodChannel.initialize();
    if (textureId == null) {
      throw const BankCardScannerException(
        message: "textureId == null",
      );
    }

    this.value = value.copyWith(
      isInitialized: true,
      textureId: textureId,
    );
    notifyListeners();
  }

  Future<void> resume() async {
    this._checkState();
    await BankCardScannerPlatform.instance.pause();
    this.value = value.copyWith(isStarted: true);
  }

  Future<String?> getPlatformVersion() =>
      BankCardScannerPlatform.instance.getPlatformVersion();

  Future<void> pause() async {
    this._checkState();
    await BankCardScannerPlatform.instance.pause();
    this.value = value.copyWith(isStarted: false);
  }

  Future<void> switchFlashlight() async {
    this._checkState();
    if (this.value.hasFlashlight == false) {
      return;
    }

    return BankCardScannerPlatform.instance.switchFlashlight(
      isOnFlashlight: !this.value.hasFlashlight,
    );
  }

  @override
  void dispose() {
    this._checkState();
    this.value = value.copyWith(isDisposed: true);
    this._methodChannel.dispose();
    super.dispose();
  }

  void _checkState() {
    if (this.value.isInitialized == false) {
      throw const BankCardScannerException(
        message: "Bank Card Scanner not yet initialized",
      );
    }

    if (this.value.isStarted) {
      throw const BankCardScannerException(
        message: "Bank Card Scanner already resumed",
      );
    }

    if (this.value.isDisposed) {
      throw const BankCardScannerException(
        message: "Bank Card Scanner is disposed",
      );
    }
  }
}
