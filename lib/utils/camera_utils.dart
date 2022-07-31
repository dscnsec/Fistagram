import 'dart:typed_data';

import 'package:fistagram/page/upload_page.dart';
import 'package:fistagram/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraUtils extends StatefulWidget {
  const CameraUtils({key, required this.camera, required this.file_callback});
  final ValueGetter file_callback;
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
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(child: Container(), flex: 1),
        //*---------------------Capture Button--------------
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () async {
              try {
                await _initializeControllerFuture;
                XFile file = await _cameraController.takePicture();
                widget.file_callback(await file.readAsBytes());
              } catch (e) {
                debugPrint("take picture error: ${e.toString()}");
              }
            },
            child: Stack(alignment: Alignment.center, children: const [
              Icon(Icons.circle_outlined, color: Colors.white, size: 80),
              Icon(Icons.circle, color: Colors.white, size: 60)
            ]),
          ),
        ),
        Flexible(child: Container(), flex: 1),
        //*---------------------Gallery Button--------------
        Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Image.asset('assets/img/UI/gallery_icon.png',
                      width: 22, fit: BoxFit.contain),
                ),
                radius: 22,
              )),
        ),
        Flexible(child: Container(), flex: 1)
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

typedef ValueGetter<Uint8List> = Uint8List Function(Uint8List file);
