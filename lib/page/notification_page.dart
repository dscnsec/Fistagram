import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
      child: SafeArea(child: Container(
        alignment: Alignment.center, 
        child: Text('Notification Page'),)),
    ); 
  }
}