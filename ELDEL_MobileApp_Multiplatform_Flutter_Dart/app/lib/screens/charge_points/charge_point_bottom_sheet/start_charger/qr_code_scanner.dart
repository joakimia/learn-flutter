import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';

import 'package:app/core/top_app_bar.dart';
import 'package:app/shared/widgets/svg_icon.dart';
import 'package:app/shared/constants/label.dart';
import 'package:app/styles/borders.dart';
import 'package:app/styles/colors.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRCodeScanner();
}

class _QRCodeScanner extends State<QRCodeScanner> {
  QRViewController? _controller;
  Barcode? _qrCodeResult;
  final GlobalKey qrKey = GlobalKey(debugLabel: scanQRCodeLabel);

  var _cameraFacing = CameraFacing.back;
  var _isFlashOn = false;
  var _isKeyboardActive = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _pauseCamera();
    }
    _resumeCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: EldelTopAppBar.getAppBarByLabel(scanQRCodeLabel),
    body: Column(
      children: [
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              QRView(
                key: qrKey,
                onQRViewCreated: _setQRViewController,
                onPermissionSet: (QRViewController _, bool hasPermission) =>
                    _validateCameraPermission(context, hasPermission),
                cameraFacing: _cameraFacing,
                overlay: QrScannerOverlayShape(
                  borderColor: eldelColorPrimary,
                  borderRadius: borderRadiusSmall,
                  borderLength: 75,
                  borderWidth: 10,
                  cutOutSize: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 100.0,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: const EldelSvgIcon(
                            semanticsLabel: flipCameraLabel,
                            svgImgPath: 'assets/icons/flip_camera.svg',
                          ),
                          onPressed: _flipCamera),
                      IconButton(
                          icon: EldelSvgIcon(
                              semanticsLabel: toggleFlashLabel,
                              svgImgPath: _isFlashOn
                                  ? 'assets/icons/flash_on.svg'
                                  : 'assets/icons/flash_off.svg',
                              color: _isFlashOn
                                  ? iconColorPrimary
                                  : eldelColorInactiveWidget),
                          onPressed: _toggleFlash),
                      IconButton(
                          icon: EldelSvgIcon(
                            semanticsLabel: enterCodeManuallyLabel,
                            svgImgPath: _isKeyboardActive
                              ? 'assets/icons/keyboard_hide.svg'
                              : 'assets/icons/keyboard_show.svg',
                          ),
                          onPressed: _toggleKeyboard)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );

  void _setQRViewController(QRViewController controller) {
    setState(() {
      _controller = controller;
    });

    controller.scannedDataStream.listen((Barcode scanData) {
      setState(() {
        _qrCodeResult = scanData;
      });
    });
  }

  void _validateCameraPermission(BuildContext context, bool hasPermission) {
    if (!hasPermission) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(noPermissionLabel)),
      );
    }
  }

  void _toggleFlash() async {
    await _controller?.toggleFlash();
    var flashStatus = await _controller?.getFlashStatus();

    setState(() {
      _isFlashOn = !_isFlashOn;
      flashStatus ?? false;
    });
  }

  void _pauseCamera() async {
    await _controller?.pauseCamera();
  }

  void _resumeCamera() async {
    await _controller?.resumeCamera();
  }

  void _flipCamera() async {
    await _controller?.flipCamera();
    var cameraFacingStatus = await _controller?.getCameraInfo();

    setState(() {
      _cameraFacing = cameraFacingStatus ?? CameraFacing.back;
    });
  }

  void _toggleKeyboard() {
    print("open input field");

    setState(() {
      _isKeyboardActive = !_isKeyboardActive;
    });
  }
}
