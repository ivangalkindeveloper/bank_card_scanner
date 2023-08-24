import 'package:bank_card_scanner/core/data/controller/bank_card_scanner_controller.dart';
import 'package:bank_card_scanner/core/data/data/bank_card_scanner_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BankCardScanner extends StatelessWidget {
  const BankCardScanner({
    super.key,
    required this.controller,
    this.background = const Color(0xFF000000),
  });

  final BankCardScannerController controller;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<BankCardScannerState>(
      valueListenable: this.controller,
      builder: (
        BuildContext context,
        BankCardScannerState state,
        Widget? child,
      ) {
        if (state.isInitialized == false || state.textureId == null) {
          return Container(
            color: this.background,
          );
        }

        return Stack(
          children: [
            ClipRect(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Texture(
                  textureId: state.textureId!,
                ),
              ),
            ),
            child ?? const SizedBox(),
          ],
        );
      },
    );
  }
}
