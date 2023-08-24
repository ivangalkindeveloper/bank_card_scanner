// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
// import 'package:bank_card_scanner/core/domain/bank_card_scan_result.dart';
// import 'package:flutter/services.dart';
// import 'dart:io';

// class BankCardParser {
//   static const Map<DeviceOrientation, int> orientations = {
//     DeviceOrientation.portraitUp: 0,
//     DeviceOrientation.landscapeLeft: 90,
//     DeviceOrientation.portraitDown: 180,
//     DeviceOrientation.landscapeRight: 270,
//   };

  // Future<InputImage?> parseFrame({
  //   required CameraController cameraController,
  //   required CameraImage image,
  //   required Duration delay,
  //   required DateTime lastDecode,
  //   required ValueChanged<DateTime> onFrameDecode,
  // }) async {
  //   if (lastDecode.add(delay).isBefore(DateTime.now())) {
  //     return null;
  //   }

  //   onFrameDecode(DateTime.now());

  //   final int sensorOrientation =
  //       cameraController.description.sensorOrientation;
  //   InputImageRotation? rotation;

  //   if (Platform.isIOS) {
  //     rotation = InputImageRotationValue.fromRawValue(
  //       sensorOrientation,
  //     );
  //   }
  //   if (Platform.isAndroid) {
  //     int? rotationCompensation =
  //         _orientations[cameraController.value.deviceOrientation];
  //     if (rotationCompensation == null) {
  //       return null;
  //     }
  //     if (cameraController.description.lensDirection ==
  //         CameraLensDirection.front) {
  //       rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
  //     } else {
  //       rotationCompensation =
  //           (sensorOrientation - rotationCompensation + 360) % 360;
  //     }
  //     rotation = InputImageRotationValue.fromRawValue(
  //       rotationCompensation,
  //     );
  //   }

  //   if (rotation == null) {
  //     return null;
  //   }

  //   final InputImageFormat? format = InputImageFormatValue.fromRawValue(
  //     image.format.raw,
  //   );

  //   if (image.planes.isEmpty) {
  //     return null;
  //   }

  //   return InputImage.fromBytes(
  //     bytes: image.planes.first.bytes,
  //     metadata: InputImageMetadata(
  //       size: Size(image.width.toDouble(), image.height.toDouble()),
  //       rotation: rotation,
  //       format: format ?? InputImageFormat.yuv420,
  //       bytesPerRow: image.planes.first.bytesPerRow,
  //     ),
  //   );
  // }

  // final int _cardNumberLength = 16;
  // final String _cardVisa = 'Visa';
  // final String _cardMasterCard = 'MasterCard';
  // final String _cardUnknown = 'Unknown';
  // final String _cardVisaParam = '4';
  // final String _cardMasterCardParam = '5';
  // final String _expiryDateRegEx = r'/^(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})$/;';
  // final TextRecognizer _textDetector = TextRecognizer(
  //   script: TextRecognitionScript.latin,
  // );

  // Future<BankCardScanResult?> detectCardContent({
  //   required InputImage inputImage,
  // }) async {
  //   final RecognizedText input = await _textDetector.processImage(inputImage);

  //   final List<String> clearElements = input.blocks
  //       .map(
  //         (TextBlock block) => block.text.clean(),
  //       )
  //       .toList();

  //   try {
  //     final String possibleCardNumber = clearElements.firstWhere((input) {
  //       final String cleanValue = input.fixPossibleMisspells();
  //       return (cleanValue.length == _cardNumberLength) &&
  //           (int.tryParse(cleanValue) ?? -1) != -1;
  //     });
  //     final String cardType = _getCardType(possibleCardNumber);
  //     final String expire = _getExpireDate(clearElements);
  //     return CardInfo(
  //       number: possibleCardNumber,
  //       type: cardType,
  //       expiry: expire,
  //     );
  //   } catch (e, _) {
  //     return null;
  //   }
  // }

  // String _getExpireDate(List<String> input) {
  //   try {
  //     return input.firstWhere((input) {
  //       final String cleanValue = input.fixPossibleMisspells();
  //       return RegExp(
  //         _expiryDateRegEx,
  //       ).hasMatch(
  //         cleanValue,
  //       );
  //     });
  //   } catch (e, _) {
  //     return '';
  //   }
  // }

  // String _getCardType(String input) {
  //   if (input[0] == _cardVisaParam) {
  //     return _cardVisa;
  //   }
  //   if (input[0] == _cardMasterCardParam) {
  //     return _cardMasterCard;
  //   }
  //   return _cardUnknown;
  // }
// }

// extension StringExtension on String {
//   String clean() => replaceAll(RegExp(r'\D'), '');

//   //L,l,S,s,o,O
//   String fixPossibleMisspells() => replaceAll('L', '1')
//     ..replaceAll('l', '1')
//     ..replaceAll('S', '5')
//     ..replaceAll('s', '5')
//     ..replaceAll('o', '0')
//     ..replaceAll('O', '0');
// }
