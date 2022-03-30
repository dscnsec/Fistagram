import 'package:fistagram/utils/colors.dart';
import 'package:fistagram/widgets/notification_box.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: backgroundColor,
     appBar: AppBar(
       centerTitle: true,
       toolbarHeight: 60,
       title: const Text('Notifications', 
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
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  const [
              // *--------------------------------------Demo Data---------------------------------------------------
              // *---------------------Below code will be replaced by item builder later----------------------------
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300
                ), 
              ),
              SizedBox( height: 10,),
              NotificationBox(profilePicPath: "assets/img/user_pics/01.jpg", userId: "puser", notificationMessage: "liked your post.", timePassed: "11m", isFollow: false, postPic: "assets/img/post/03.jpg",),
              NotificationBox(profilePicPath: "assets/img/user_pics/02.jpg", userId: "dpuser", notificationMessage: "started following you.", timePassed: "2h", isFollow: true),
              NotificationBox(profilePicPath: "assets/img/user_pics/03.jpg", userId: "spuser", notificationMessage: "commented on your post.", timePassed: "2h", isFollow: false, postPic: "assets/img/post/02.jpg",),
              NotificationBox(profilePicPath: "assets/img/user_pics/01.jpg", userId: "puser", notificationMessage: "liked your post.", timePassed: "3h", isFollow: false, postPic: "assets/img/post/01.jpg",),
              SizedBox( height: 10),
              Text(
                'Yesterday',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300
                ), 
              ),
              SizedBox( height: 10,),
              NotificationBox(profilePicPath: "assets/img/user_pics/01.jpg", userId: "puser", notificationMessage: "liked your post.", timePassed: "1d", isFollow: false, postPic: "assets/img/post/04.jpg",),
              NotificationBox(profilePicPath: "assets/img/user_pics/02.jpg", userId: "dpuser", notificationMessage: "started following you.", timePassed: "1d", isFollow: true),
              NotificationBox(profilePicPath: "assets/img/user_pics/03.jpg", userId: "spuser", notificationMessage: "commented on your post.", timePassed: "1d", isFollow: false, postPic: "assets/img/post/05.jpg",),
              NotificationBox(profilePicPath: "assets/img/user_pics/01.jpg", userId: "puser", notificationMessage: "liked your post.", timePassed: "1d", isFollow: false, postPic: "assets/img/post/01.jpg",),
              NotificationBox(profilePicPath: "assets/img/user_pics/01.jpg", userId: "puser", notificationMessage: "liked your post.", timePassed: "1d", isFollow: false, postPic: "assets/img/post/05.jpg",),
              NotificationBox(profilePicPath: "assets/img/user_pics/02.jpg", userId: "dpuser", notificationMessage: "started following you.", timePassed: "1d", isFollow: true),
              SizedBox( height: 10),
              Text(
                'This Week',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300
                ), 
              ),
              SizedBox( height: 10,),
              NotificationBox(profilePicPath: "assets/img/user_pics/01.jpg", userId: "puser", notificationMessage: "liked your post.", timePassed: "2d", isFollow: false, postPic: "assets/img/post/01.jpg",),
              NotificationBox(profilePicPath: "assets/img/user_pics/02.jpg", userId: "dpuser", notificationMessage: "started following you.", timePassed: "5d", isFollow: true),
              NotificationBox(profilePicPath: "assets/img/user_pics/03.jpg", userId: "spuser", notificationMessage: "commented on your post.", timePassed: "1w", isFollow: false, postPic: "assets/img/post/02.jpg",),
              NotificationBox(profilePicPath: "assets/img/user_pics/01.jpg", userId: "puser", notificationMessage: "liked your post.", timePassed: "1w", isFollow: false, postPic: "assets/img/post/01.jpg",),
              SizedBox( height: 10),           
            ],
          )
          )
        ),
      ),
   ); 
  }
}