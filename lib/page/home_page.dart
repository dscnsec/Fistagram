import 'package:fistagram/custom_icons_icons.dart';
import 'package:fistagram/page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:fistagram/utils/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width= MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.fromLTRB(width*0.09, 0, width*0.09, 0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPage()));
            },
            icon: Icon(CustomIcons.clarity_search_line, size: 30, color: primaryColor)),
          title: const Text(
            'Fistagram',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300
            ),
            ),
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: CircleAvatar(
                child: Image.asset("assets/img/profile_pic.png"),
                radius: 30,
              ))
          ],
          elevation: 0,
        ),
        
      ),
    );
  }
}