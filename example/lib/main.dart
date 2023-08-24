import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bank_card_scanner/bank_card_scanner.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterPlatformComponent(
    child: Application(),
  ));
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return FPCApp(
      home: const Screen(),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return FPCScaffold(
      appBar: FPCScreenAppBar(
        context: context,
        title: "Bank Card Scanner",
      ),
      body: FPCPadding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FPCPrimaryButton(
            title: "Open Scanner",
            onPressed: () async {
              if ((await Permission.camera.status.isDenied) &&
                  (await Permission.camera.request()).isDenied) {
                return;
              }

              await showFPCExpandedModal(
                context: context,
                child: const ScannerModal(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ScannerModal extends StatefulWidget {
  const ScannerModal({super.key});

  @override
  State<ScannerModal> createState() => _ScannerModalState();
}

class _ScannerModalState extends State<ScannerModal> {
  final BankCardScannerController _bankCardScannerController =
      BankCardScannerController(
    onScan: (value) {},
  );

  @override
  void initState() {
    super.initState();
    this._init();
  }

  Future<void> _init() async {
    await this._bankCardScannerController.initialize();
  }

  @override
  void dispose() {
    this._bankCardScannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FPCBlurExpandedModal(
      appBarTitle: "Card Scanner",
      body: BankCardScanner(
        controller: this._bankCardScannerController,
      ),
    );
  }
}
