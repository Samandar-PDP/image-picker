import 'package:flutter/material.dart';
import 'package:storage_flutter/images_screen.dart';

import 'main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ImagesScreen(),
    );
  }
}
