import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraUtils extends StatefulWidget {
  const CameraUtils({key, required this.camera});

  final CameraDescription camera;
  @override
  State<CameraUtils> createState() => _CameraUtilsState();
}

class _CameraUtilsState extends State<CameraUtils> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(widget.camera, ResolutionPreset.high);
    _initializeControllerFuture = _cameraController.initialize();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
              child: Transform.scale(
                  scale: _cameraController.value.aspectRatio,
                  child: CameraPreview(_cameraController)));
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
