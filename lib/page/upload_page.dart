import 'package:fistagram/utils/colors.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
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
              const Text('Under Construction\nUpload Page',
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