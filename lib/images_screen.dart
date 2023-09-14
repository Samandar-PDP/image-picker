import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  final List<File> _images = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return _images.isEmpty ? Center(
      child: ElevatedButton(
        onPressed: () async {
          final pickedImages = await picker.pickMultiImage(
            imageQuality: 100,
            maxHeight: 300,
            maxWidth: 300
          );
          pickedImages.forEach((element) {
            _images.add(File(element.path));
          });
          setState(() {});
        },
        child: Text('Pick images'),
      ),
    ) : GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12
      ),
      itemCount: _images.length,
      itemBuilder: (context, index) => Image.file(_images[index]),
    );
  }
}
