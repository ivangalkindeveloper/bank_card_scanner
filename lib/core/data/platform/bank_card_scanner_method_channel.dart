// import 'package:bank_card_scanner/core/data/data/bank_card_scanner_channel_receive_event.dart';
import 'package:bank_card_scanner/core/data/platform/bank_card_scanner_platform_interface.dart';
import 'package:bank_card_scanner/core/data/data/bank_card_scanner_channel_send_event.dart';
import 'package:bank_card_scanner/core/data/data/camera_direction.dart';
// import 'package:bank_card_scanner/core/data/data/event_channel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class BankCardScannerMethodChannel implements BankCardScannerPlatform {
  BankCardScannerMethodChannel({
    this.onFlashlightState,
    this.onFrame,
  });

  final VoidCallback? onFlashlightState;
  final VoidCallback? onFrame;

  @visibleForTesting
  static const MethodChannel methodChannel = MethodChannel("bank_card_scanner");
  // @visibleForTesting
  // static const EventChannel eventChannel =
  //     EventChannel("bank_card_scanner_event");
  late final StreamSubscription? _eventsSubscription;

  Future<int?> initialize() async {
    // this._eventsSubscription =
    //     eventChannel.receiveBroadcastStream().listen(this._handleEvent);
    return await methodChannel.invokeMethod<int>(
      BankCardScannerMethodChannelSendEvent.initialize.name,
    );
  }

  @override
  Future<String?> getPlatformVersion() =>
      methodChannel.invokeMethod<String>('getPlatformVersion');

  @override
  Future<void> resume() => methodChannel.invokeMethod<void>(
        BankCardScannerMethodChannelSendEvent.resume.name,
      );

  @override
  Future<void> pause() => methodChannel.invokeMethod<void>(
        BankCardScannerMethodChannelSendEvent.pause.name,
      );

  @override
  Future<void> switchCamera({
    required CameraDirection direction,
  }) =>
      methodChannel.invokeMethod<void>(
        BankCardScannerMethodChannelSendEvent.switchCamera.name,
        direction.name,
      );

  @override
  Future<void> switchFlashlight({
    required bool isOnFlashlight,
  }) =>
      methodChannel.invokeMethod<void>(
        BankCardScannerMethodChannelSendEvent.switchFlashlight.name,
        isOnFlashlight,
      );

  void dispose() {
    this._eventsSubscription?.cancel();
  }

  // void _handleEvent(dynamic event) {
  //   if (!event is Map) {
  //     return;
  //   }

  //   final ChannelEvent currentEvent = ChannelEvent.fromMap(
  //     event as Map,
  //   );
  //   final BankCardScannerMethodChannelRecieveEvent type =
  //       BankCardScannerMethodChannelRecieveEvent.fromString(
  //     currentEvent.name,
  //   );

  //   switch (type) {
  //     case BankCardScannerMethodChannelRecieveEvent.flashlightState:
  //     // this.onFlashlightState();
  //     case BankCardScannerMethodChannelRecieveEvent.frame:
  //     // this.onFrame();
  //     default:
  //       return;
  //   }
  // }
}
