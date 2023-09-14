import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final picker = ImagePicker();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            if(_image != null)
              Image.file(_image!),

            CupertinoButton(onPressed: () {
              showCupertinoModalPopup(context: context, builder: (context) {
                return CupertinoActionSheet(
                  title: Text('Gallery or Camera'),
                  actions: [
                    CupertinoActionSheetAction(onPressed: () {
                      _getFromGallery();
                      Navigator.of(context).pop();
                    }, child: Text('Gallery')),
                    CupertinoActionSheetAction(onPressed: () {
                      _getFromCamera();
                      Navigator.of(context).pop();
                    }, child: Text('Camera')),
                  ],
                );
              }
              );
            }, child: Text('Pick image'))
          ],
        ),
      ),
    );
  }
  void _getFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null) {
      _image = File(pickedFile.path);
      setState(() {});
    }
  }
  void _getFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if(pickedFile != null) {
      _image = File(pickedFile.path);
      setState(() {});
    }
  }
}
