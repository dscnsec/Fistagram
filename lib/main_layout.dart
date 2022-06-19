import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fistagram/custom_icons_icons.dart';
import 'package:fistagram/page/setting_page.dart';
import 'package:fistagram/page/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:fistagram/page/home_page.dart';
import 'package:fistagram/page/notification_page.dart';
import 'package:fistagram/page/search_page.dart';

class MainLayout extends StatefulWidget {
  MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _page = 0;

  final screens = [
    HomePage(),
    SearchPage(),
    UploadPage(),
    NotificationPage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(CustomIcons.clarity_home_line, size: 30),
      const Icon(CustomIcons.clarity_search_line, size: 30),
      const Icon(CustomIcons.akar_icons_plus, size: 35),
      const Icon(CustomIcons.clarity_bell_outline_badged, size: 30),
      const Icon(CustomIcons.akar_icons_settings_horizontal3, size: 30)
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 239, 243, 245),
      body: screens[_page],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: const Color.fromARGB(255, 60, 97, 112))),
        child: CurvedNavigationBar(
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          color: const Color.fromARGB(255, 246, 252, 255),
          height: 65,
          items: items,
          index: 0,
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
      ),
    );
  }
}
