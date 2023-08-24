import 'dart:typed_data';

class CameraFrame {
  const CameraFrame({
    this.height,
    this.width,
    this.bytes,
  });

  final double? height;
  final double? width;
  final Uint8List? bytes;

  factory CameraFrame.fromJson(Map<String, dynamic> json) => CameraFrame(
        height: json["height"],
        width: json["width"],
        bytes: json["bytes"],
      );
}
