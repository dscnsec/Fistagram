import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
      child: SafeArea(child: Container(
        alignment: Alignment.center, 
        child: Text('Upload Page'),)),
    );
  }
}