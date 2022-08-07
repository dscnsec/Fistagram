import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:fistagram/custom_icons_icons.dart';
import 'package:fistagram/main.dart';
import 'package:fistagram/models/user.dart';
import 'package:fistagram/providers/user_provider.dart';
import 'package:fistagram/resources/firestore_methods.dart';
import 'package:fistagram/utils/colors.dart';
import 'package:fistagram/widgets/camera_screen.dart';
import 'package:fistagram/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadPage extends StatefulWidget {
  UploadPage({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;
  void postImage(
    String uid,
    String username,
    String profImage,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadPost(
          _descriptionController.text, _file!, uid, username, profImage);

      if (res == "success") {
        clearImage();
        setState(() {
          _isLoading = false;
        });
        showSnackBar('Posted!', context);
      } else
        showSnackBar('res', context);
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  //Todo: replace upload dialog box with camera interface

  _cameraPreviewSelectImage(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      widthFactor: 0.9,
      heightFactor: 0.88,
      child: ClipSmoothRect(
          radius: SmoothBorderRadius(cornerRadius: 12, cornerSmoothing: 1),
          child: Stack(
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.bottomCenter,
              children: [
                CameraScreen(
                  cameras: cameras,
                  file_callback: (file) async {
                    await file;
                    setState(() {
                      _file = file;
                    });
                  },
                ),
              ])),
    );
  }

  // _selectImage(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return SimpleDialog(
  //           title: const Text('Creat a Post'),
  //           children: [
  //             SimpleDialogOption(
  //               padding: const EdgeInsets.all(2),
  //               child: const Text('Take a photo'),
  //               onPressed: () async {
  //                 Navigator.of(context).pop();
  //                 Uint8List file = await pickImage(
  //                   ImageSource.camera,
  //                 );
  //                 setState(() {
  //                   _file = file;
  //                 });
  //               },
  //             ),
  //             SimpleDialogOption(
  //                 padding: const EdgeInsets.all(2),
  //                 child: const Text('Choose from gallery'),
  //                 onPressed: () async {
  //                   Navigator.of(context).pop();
  //                   Uint8List file = await pickImage(
  //                     ImageSource.gallery,
  //                   );
  //                   setState(() {
  //                     _file = file;
  //                   });
  //                 }),
  //             SimpleDialogOption(
  //                 padding: const EdgeInsets.all(2),
  //                 child: const Text('Cancel'),
  //                 onPressed: () async {
  //                   Navigator.of(context).pop();
  //                 })
  //           ],
  //         );
  //       });
  // }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return _file == null
        ? Container(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: _cameraPreviewSelectImage(context)),
                ]),
          )
        // Center(
        //     child: IconButton(
        //     icon: const Icon(Icons.upload),
        //     onPressed: () {
        //       _selectImage(context);
        //     },
        //   ))
        : Scaffold(
            appBar: AppBar(
              foregroundColor: primaryColor,
              backgroundColor: backgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  clearImage();
                },
              ),
              title: const Text(
                'Post to',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              centerTitle: false,
              actions: [
                TextButton(
                    onPressed: () =>
                        postImage(user.uid, user.username, user.profilePicUrl),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.zero),
                      // Todo: Fix Post button style
                      // backgroundColor:
                      //     MaterialStateProperty.all(primaryButtonColor),
                      // fixedSize: MaterialStateProperty.all(const Size(10, 20)),
                      // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //     RoundedRectangleBorder(
                      //         borderRadius: SmoothBorderRadius(
                      //             cornerRadius: 5, cornerSmoothing: 1)))
                    ),
                    child: const Text('Post',
                        style: TextStyle(
                            color: primaryButtonColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400))),
              ],
              elevation: 0,
            ),
            backgroundColor: backgroundColor,
            body: SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _isLoading
                          ? const LinearProgressIndicator()
                          : const Padding(padding: EdgeInsets.only(top: 0)),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(user.profilePicUrl),
                              backgroundColor: Colors.transparent),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextField(
                                controller: _descriptionController,
                                decoration: const InputDecoration(
                                    hintText: 'Write a caption....',
                                    border: InputBorder.none),
                                maxLines: 8,
                              ))
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: AspectRatio(
                            aspectRatio: 4 / 5,
                            child: ClipSmoothRect(
                              radius: SmoothBorderRadius(
                                cornerRadius: 12,
                                cornerSmoothing: 1,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: MemoryImage(_file!),
                                      fit: BoxFit.cover,
                                      alignment: FractionalOffset.topCenter),
                                ),
                              ),
                            )),
                      )
                    ],
                  )),
            ),
          );
  }
}
