import 'package:figma_squircle/figma_squircle.dart';
import 'package:fistagram/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fistagram/widgets/follow_button.dart';

class NotificationBox extends StatefulWidget {
  final String profilePicPath;
  final String userId;
  final String notificationMessage;
  final String timePassed;
  final bool isFollow;
  final String postPic;
  const NotificationBox({
    Key? key,
    required this.profilePicPath,
    required this.userId,
    required this.notificationMessage,
    required this.timePassed,
    required this.isFollow,
    this.postPic = "",
  }) : super(key: key);

  @override
  State<NotificationBox> createState() => _NotificationBoxState();
}

class _NotificationBoxState extends State<NotificationBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(children: [
        CircleAvatar(
          radius: 20,
          child: ClipOval(child: Image.asset(widget.profilePicPath)),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.userId,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(widget.notificationMessage,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(widget.timePassed,
                      style: const TextStyle(
                          color: primaryShadowColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
        if (widget.isFollow)
          FollowButton()
        else
          ClipSmoothRect(
              radius: SmoothBorderRadius(
                cornerRadius: 6,
                cornerSmoothing: 1,
              ),
              child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(widget.postPic, fit: BoxFit.cover)))
      ]),
    );
  }
}
