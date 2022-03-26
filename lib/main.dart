import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fistagram/custom_icons_icons.dart';
import 'package:fistagram/page/home_page.dart';
import 'package:fistagram/page/notification_page.dart';
import 'package:fistagram/page/search_page.dart';
import 'package:fistagram/page/setting_page.dart';
import 'package:fistagram/page/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(255, 239, 243, 245),
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Color.fromARGB(235, 246, 252, 255),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: const Color.fromARGB(255, 239, 243, 245)
      ),
      home: MainPage()
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page=0;

  final screens = [
   HomePage(),
   SearchPage(),
   UploadPage(),
   NotificationPage(),
   SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    final items= <Widget>[
      Icon(CustomIcons.clarity_home_line, size: 30),
      Icon(CustomIcons.clarity_search_line, size: 30),
      Icon(CustomIcons.akar_icons_plus, size: 35),
      Icon(CustomIcons.clarity_bell_outline_badged, size: 30),
      Icon(CustomIcons.akar_icons_settings_horizontal3, size: 30)
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 243, 245),
      body: screens[_page],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 60, 97, 112))
        ),
        child: CurvedNavigationBar(
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          color: Color.fromARGB(235, 246, 252, 255),
          height: 65,
          items: items,
          index: 0,
          onTap: (index){
            setState((){
              _page = index;
            });
          },
        ),
      ), 
    );
  }
}