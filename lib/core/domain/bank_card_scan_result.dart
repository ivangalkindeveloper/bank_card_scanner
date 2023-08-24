class BankCardScanResult {
  const BankCardScanResult({
    required this.pan,
    required this.cardholderName,
    required this.expiryMonth,
    required this.expiryYear,
    // required this.paymentSystem,
  });

  final String pan;
  final String? cardholderName;
  final int? expiryMonth;
  final int? expiryYear;
  // final PaymentSystem? paymentSystem;

  factory BankCardScanResult.fromJson(
    Map<String, dynamic> json,
  ) =>
      BankCardScanResult(
        pan: json["pan"],
        cardholderName: json["cardholderName"],
        expiryMonth: json["expiryMonth"],
        expiryYear: json["expiryYear"],
        // paymentSystem: json["paymentSystem"],
      );

  // @override
  // String toString() =>
  //     "Pan: $pan\nCardholderName:$cardholderName\nExpiryMonth:$expiryMonth\nExpiryYear: $expiryYear\nPayment system: ${paymentSystem?.name}";
}
