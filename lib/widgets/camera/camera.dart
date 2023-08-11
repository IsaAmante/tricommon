import 'dart:io';

import 'package:camera/camera.dart';
import 'package:tricommon/core/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/consts/consts.dart';
import '../widgets.dart';

typedef PhotoPreview = void Function(Uint8List);

class TribancoCamera extends StatefulWidget {
  const TribancoCamera({
    super.key,
    required this.overlay,
    required this.buttonText,
    required this.photoPreview,
  });

  final Widget overlay;
  final String buttonText;
  final PhotoPreview photoPreview;

  @override
  State<StatefulWidget> createState() => TribancoCameraState();
}

class TribancoCameraState extends State<TribancoCamera> with WidgetsBindingObserver {
  late CameraController _cameraController;
  bool _loading = true;
  bool _hasCameras = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      setState(() {
        _loading = true;
        _error = '';
      });
      _initializeCamera();
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _buildCamera();

  void _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      setState(() {
        _loading = false;
        _hasCameras = false;
      });
      return;
    }
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.max,
      enableAudio: false,
    );
    try {
      await _cameraController.initialize();
      await _cameraController.setFlashMode(FlashMode.off);
      await Future.delayed(const Duration(milliseconds: 200));
      setState(() {
        _loading = false;
      });
    } catch (error) {
      if (error is CameraException) {
        switch (error.code) {
          case 'CameraAccessDenied':
            setState(() {
              _loading = false;
              _error = 'Acesso a câmera negado.';
            });
            break;
          default:
            setState(() {
              _loading = false;
              _error = 'Erro ao abrir a câmera.';
            });
            break;
        }
      }
    }
  }

  Widget _buildCamera() {
    if (_loading) {
      return Container(
        color: ColorPalette.colorNeutralWhite,
        child: const Center(child: CircularLoading()),
      );
    }
    if (!_hasCameras) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: Spacing.xSmall.wsp,
          vertical: Spacing.xSmall.hsp,
        ),
        child: Column(
          children: [
            Expanded(
                child: Center(child: const Text('Não existem câmeras disponíveis').xMedium(style: TextStyle(fontWeight: FontWeight.w700, color: ColorPalette.colorTertiaryA500)))),
            SizedBox(height: Spacing.xSmall.hsp),
            TribancoButton(
              text: 'VOLTAR',
              type: ButtonType.secondary,
              onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(height: Spacing.xSmall.hsp)
          ],
        ),
      );
    }
    if (_error.isNotEmpty) {}
    final scale = 1 / (_cameraController.value.aspectRatio * MediaQuery.of(context).size.aspectRatio);
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Transform.scale(
            scale: scale,
            alignment: Alignment.topCenter,
            child: CameraPreview(_cameraController),
          ),
        ),
        SafeArea(child: widget.overlay),
        SafeArea(
          child: Container(
            margin: EdgeInsets.fromLTRB(
              Spacing.xSmall.wsp,
              0,
              Spacing.xSmall.wsp,
              Spacing.xSmall.hsp,
            ),
            alignment: Alignment.bottomCenter,
            child: _button(context: context),
          ),
        ),
      ],
    );
  }

  Widget _button({required BuildContext context}) {
    return TribancoButton(
      text: widget.buttonText,
      onPressed: () async {
        final xFile = await _cameraController.takePicture();
        final path = xFile.path;
        final bytes = await File(path).readAsBytes();
        widget.photoPreview(bytes);
      },
    );
  }
}
