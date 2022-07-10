import 'package:figma_squircle/figma_squircle.dart';
import 'package:fistagram/custom_icons_icons.dart';
import 'package:fistagram/utils/colors.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: primaryColor,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text(
          'Post to',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        centerTitle: false,
        actions: [
          TextButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            NetworkImage("https://placekitten.com/240/240"),
                        backgroundColor: Colors.transparent),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextField(
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
                                image: NetworkImage(
                                    "https://placekitten.com/640/480"),
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
