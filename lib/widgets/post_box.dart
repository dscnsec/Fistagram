import 'package:figma_squircle/figma_squircle.dart';
import 'package:fistagram/custom_icons_icons.dart';
import 'package:fistagram/utils/colors.dart';
import 'package:flutter/material.dart';

class PostBox extends StatefulWidget {
  final String userId;
  final likes, numberOfComments;
  final String imagePath;
  const PostBox({
    Key? key,
    required this.userId,
    required this.likes,
    required this.numberOfComments,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<PostBox> createState() => _PostBoxState();
}

class _PostBoxState extends State<PostBox> {
  //final userIds = ["spxd_insta"];
  //final likes=[3];
  //final comments=[1];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(children: [
        //---------------------Header section--------------------
        Container(
          child: Row(
            children: [
              const SizedBox(
                width: 6,
              ),
              CircleAvatar(
                radius: 13,
                child: Image.asset("assets/img/profile_pic.png"),
              ),
              const Padding(
                  padding: EdgeInsets.only(
                left: 10,
              )),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.userId,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w300))
                ],
              )),
              SizedBox(
                width: 25,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 30,
                    onPressed: () {
                      debugPrint("Pressed post menu");
                      PopupMenuButton(
                          itemBuilder: (context) => ['Delete']
                              .map((e) => PopupMenuItem(
                                    child: Text(e),
                                    onTap: () {},
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 11, horizontal: 16),
                                  ))
                              .toList());
                    },
                    icon: const Icon(Icons.more_vert, color: primaryColor)),
              )
            ],
          ),
        ),
        //-----------------------Post Image-------------------------
        ClipSmoothRect(
          radius: SmoothBorderRadius(
            cornerRadius: 12,
            cornerSmoothing: 1,
          ),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Image.asset(widget.imagePath, fit: BoxFit.cover)),
        ),
        //-----------------------Footer section----------------------
        Container(
            child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 25,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite, color: Colors.redAccent),
                iconSize: 26,
                padding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(width: 6),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.likes.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w300)),
              ],
            ),
            const SizedBox(width: 6),
            SizedBox(
              width: 25,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CustomIcons.ei_comment,
                ),
                iconSize: 20,
                padding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(width: 6),
            Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.numberOfComments.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w300))
                ]),
            Spacer(),
            SizedBox(
              width: 32,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(CustomIcons.clarity_bookmark_line),
                  iconSize: 20),
            )
          ],
        ))
      ]),
    );
  }
}
