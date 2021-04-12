import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: ADHomePage(),
    );
  }
}

class ADHomePage extends StatefulWidget {
  @override
  _ADHomePageState createState() => _ADHomePageState();
}

class _ADHomePageState extends State<ADHomePage> {
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("选择照片"),
              onPressed: _pickImage,
            ),
            _imageFile == null ? Text("请选择一张照片") : Image.file(_imageFile)
          ],
        ),
      ),
    );
  }

  void _pickImage() async {
    final imagePicker = ImagePicker();
    // camera: 相机
    // gallery: 相册
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    print(pickedFile);
    setState(() {
      if (pickedFile != null) _imageFile = File(pickedFile.path);
    });
  }
}
