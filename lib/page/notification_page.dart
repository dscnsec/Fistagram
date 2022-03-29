import 'package:fistagram/utils/colors.dart';
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
        child: SafeArea(
          child: Container(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          alignment: Alignment.center, 
          child: Column(
            children: [],
          )
          )
        ),
      ),
   ); 
  }
}