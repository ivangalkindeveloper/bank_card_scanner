import 'package:collection/collection.dart';

enum BankCardScannerMethodChannelSendEvent {
  initialize,
  resume,
  pause,
  switchCamera,
  switchFlashlight;

  static BankCardScannerMethodChannelSendEvent fromString(
    String value,
  ) {
    final BankCardScannerMethodChannelSendEvent? result =
        BankCardScannerMethodChannelSendEvent.values.firstWhereOrNull(
      (BankCardScannerMethodChannelSendEvent element) => element.name == value,
    );

    if (result == null) {
      throw ArgumentError(
        "Unknown BankCardScannerMethodChannelSendEvent: $value",
      );
    }

    return result;
  }
}
