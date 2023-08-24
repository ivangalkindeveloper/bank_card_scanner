class BankCardScannerException implements Exception {
  const BankCardScannerException({
    required this.message,
  });

  final String message;
}
