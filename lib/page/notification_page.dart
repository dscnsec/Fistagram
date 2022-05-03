import 'package:fistagram/utils/colors.dart';
import 'package:fistagram/widgets/notification_box.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  //* Demo Data
  List<List<dynamic>> today = [
    //user profic, username, message, follow_button,
    [
      "assets/img/user_pics/01.jpg",
      "puser",
      "liked your post.",
      "11m",
      false,
      "assets/img/post/03.jpg"
    ],
    [
      "assets/img/user_pics/02.jpg",
      "dpuser",
      "started following you.",
      "1h",
      true,
      ""
    ],
    [
      "assets/img/user_pics/03.jpg",
      "mpuser",
      "started following you.",
      "3h",
      true,
      ""
    ],
    [
      "assets/img/user_pics/01.jpg",
      "puser",
      "commented on your post.",
      "6h",
      false,
      "assets/img/post/02.jpg"
    ],
  ];
  List<List<dynamic>> yesterday = [
    //user profic, username, message, follow_button,
    [
      "assets/img/user_pics/01.jpg",
      "puser",
      "liked your post.",
      "1d",
      false,
      "assets/img/post/01.jpg"
    ],
    [
      "assets/img/user_pics/01.jpg",
      "puser",
      "liked your post.",
      "1d",
      false,
      "assets/img/post/05.jpg"
    ],
    [
      "assets/img/user_pics/02.jpg",
      "dpuser",
      "started following you.",
      "1d",
      true,
      ""
    ],
    [
      "assets/img/user_pics/01.jpg",
      "puser",
      "commented on your post.",
      "1d",
      false,
      "assets/img/post/02.jpg"
    ],
    [
      "assets/img/user_pics/01.jpg",
      "mpuser",
      "started following you.",
      "1d",
      true,
      ""
    ],
  ];
  List<List<dynamic>> week = [
    //user profic, username, message, follow_button,
    [
      "assets/img/user_pics/01.jpg",
      "puser",
      "liked your post.",
      "5d",
      false,
      "assets/img/post/04.jpg"
    ],
    [
      "assets/img/user_pics/01.jpg",
      "puser",
      "liked your post.",
      "1w",
      false,
      "assets/img/post/03.jpg"
    ],
    [
      "assets/img/user_pics/01.jpg",
      "puser",
      "liked your post.",
      "1w",
      false,
      "assets/img/post/02.jpg"
    ],
    [
      "assets/img/user_pics/02.jpg",
      "dpuser",
      "started following you.",
      "1w",
      true,
      ""
    ],
    [
      "assets/img/user_pics/01.jpg",
      "puser",
      "commented on your post.",
      "1w",
      false,
      "assets/img/post/05.jpg"
    ],
    [
      "assets/img/user_pics/01.jpg",
      "mpuser",
      "started following you.",
      "1w",
      true,
      ""
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
            child: Container(
                padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //*------------------Today-----------------
                    const Text(
                      'Today',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: today.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NotificationBox(
                            profilePicPath: today[index][0],
                            userId: today[index][1],
                            notificationMessage: today[index][2],
                            timePassed: today[index][3],
                            isFollow: today[index][4],
                            postPic: today[index][5],
                          );
                        }),
                    //*------------------Yesterday-----------------
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Yesterday',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: yesterday.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NotificationBox(
                            profilePicPath: yesterday[index][0],
                            userId: yesterday[index][1],
                            notificationMessage: yesterday[index][2],
                            timePassed: yesterday[index][3],
                            isFollow: yesterday[index][4],
                            postPic: yesterday[index][5],
                          );
                        }),
                    //*------------------Week-----------------
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'This Week',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: week.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NotificationBox(
                          profilePicPath: week[index][0],
                          userId: week[index][1],
                          notificationMessage: week[index][2],
                          timePassed: week[index][3],
                          isFollow: week[index][4],
                          postPic: week[index][5],
                        );
                      },
                    ),
                  ],
                ))),
      ),
    );
  }
}
