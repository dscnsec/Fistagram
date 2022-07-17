import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fistagram/custom_icons_icons.dart';
import 'package:fistagram/main.dart';
import 'package:fistagram/page/setting_page.dart';
import 'package:fistagram/page/upload_page.dart';
import 'package:fistagram/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:fistagram/page/home_page.dart';
import 'package:fistagram/page/notification_page.dart';
import 'package:fistagram/page/search_page.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  MainLayout({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    addData();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  addData() async {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }

  final screens = [
    HomePage(),
    SearchPage(),
    UploadPage(cameras: cameras,),
    NotificationPage(),
    SettingPage()
  ];

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

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
      body: PageView(
        children: screens,
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const BouncingScrollPhysics(),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(
                color: const Color.fromARGB(255, 60, 97, 112))),
        child: CurvedNavigationBar(
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          color: const Color.fromARGB(255, 246, 252, 255),
          height: 65,
          items: items,
          index: _page,
          onTap: (index) {
            setState(() {
              _page = index;
              navigationTapped(index);
            });
          },
        ),
      ),
    );
  }
}
