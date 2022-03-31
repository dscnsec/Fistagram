import 'Package:flutter/material.dart';
import 'package:fistagram/utils/colors.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
 Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: backgroundColor, 
    body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Under Construction\nSettings Page',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300
                )
              ),
              const SizedBox( height: 50,),
              Container(
                width: 250,
                child: Image.asset("assets/img/construction_pic.png", fit: BoxFit.contain))
            ],
          )),
      ),
  );
}
}