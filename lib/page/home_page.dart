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

  List<String> instaStories= [
    "assets/img/insta_stories/01.png" ,
    "assets/img/insta_stories/02.png" ,
    "assets/img/insta_stories/03.png" ,
    "assets/img/insta_stories/04.png" ,
    "assets/img/insta_stories/01.png" ,
    "assets/img/insta_stories/02.png" ,
    "assets/img/insta_stories/03.png" ,
    "assets/img/insta_stories/04.png" ,
  ] ;

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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal, 
                  physics: const BouncingScrollPhysics(),
                  children: [
                    //--------------------Upload status button-------------------------
                    CircleAvatar( 
                      backgroundColor: secondaryBackgroundColor,
                      radius: 30, 
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Image.asset("assets/img/insta_stories/00.png", ), 
                        onPressed: () {  }, iconSize: 30,) 
                      ),
                    //---------------------Stories Icon Builder------------------
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: instaStories.length,
                      itemBuilder: (BuildContext context, int index){
                        return Row(
                          children: [
                            const SizedBox( width: 15),
                            CircleAvatar(child: Image.asset(instaStories[index]), radius:30)
                          ],
                        );
                      }),

                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}