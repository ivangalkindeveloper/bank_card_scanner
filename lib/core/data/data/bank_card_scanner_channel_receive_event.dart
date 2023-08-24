import 'package:collection/collection.dart';

enum BankCardScannerMethodChannelRecieveEvent {
  flashlightState,
  frame,
  error;

  static BankCardScannerMethodChannelRecieveEvent fromString(
    String value,
  ) {
    final BankCardScannerMethodChannelRecieveEvent? result =
        BankCardScannerMethodChannelRecieveEvent.values.firstWhereOrNull(
      (BankCardScannerMethodChannelRecieveEvent element) =>
          element.name == value,
    );

    if (result == null) {
      throw ArgumentError(
        "Unknown BankCardScannerMethodChannelSendEvent: $value",
      );
    }

    return result;
  }
}
