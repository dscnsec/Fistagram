import 'package:figma_squircle/figma_squircle.dart';
import 'package:fistagram/utils/colors.dart';
import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({Key? key}) : super(key: key);

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryButtonColor),
            fixedSize: MaterialStateProperty.all(const Size(50, 20)),
            minimumSize: MaterialStateProperty.all(const Size(70, 30)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                        cornerRadius: 5, cornerSmoothing: 1)))),
        child: const Text('Follow',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400)));
  }
}
