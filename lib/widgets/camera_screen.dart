import 'dart:typed_data';

import 'package:fistagram/main.dart';
import 'package:fistagram/page/upload_page.dart';
import 'package:fistagram/utils/colors.dart';
import 'package:fistagram/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({key, required this.cameras, required this.file_callback});
  final ValueGetter file_callback;
  final List<CameraDescription> cameras;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  bool _isRearCameraSelected = true;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
        widget.cameras[_isRearCameraSelected ? 0 : 1], ResolutionPreset.high);
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
        //*------------------Reverse Camera Button----------
        Align(
            alignment: Alignment.bottomLeft,
            child: InkWell(
              onTap: () async {
                try {
                  final previousCameraController = _cameraController;

                  final newcameraController = CameraController(
                      widget.cameras[_isRearCameraSelected ? 1 : 0],
                      ResolutionPreset.high);

                  _isRearCameraSelected = !_isRearCameraSelected;

                  await previousCameraController.dispose();

                  if (mounted) {
                    setState(() {
                      _cameraController = newcameraController;
                      _initializeControllerFuture =
                          _cameraController.initialize();
                    });
                  }
                } catch (e) {
                  debugPrint("Reverse Camera button : ${e.toString()}");
                }
              },
              child: Icon(
                Icons.change_circle,
                size: 54,
                color: Colors.white,
              ),
            )),
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
              onTap: () async {
                try {
                  Uint8List file = await pickImage(ImageSource.gallery);
                  widget.file_callback(file);
                } catch (e) {
                  debugPrint("Gallery button: ${e.toString()}");
                }
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: primaryColor,
                  child: Image.asset('assets/img/UI/gallery_icon.png',
                      width: 24, fit: BoxFit.contain),
                ),
                radius: 24,
              )),
        ),
        Flexible(child: Container(), flex: 1)
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

typedef ValueGetter<Uint8List> = Uint8List Function(Uint8List file);
