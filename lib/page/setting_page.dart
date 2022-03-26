import 'Package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
      child: SafeArea(child: Container(
        alignment: Alignment.center, 
        child: Text('Setting Page'),)),
    );
  }
}