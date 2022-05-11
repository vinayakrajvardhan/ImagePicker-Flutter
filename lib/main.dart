import 'package:flutter/material.dart';
import 'package:image_picker_project/pages/imagepicservice.dart';
import 'package:image_picker_project/pages/save_image_from_cameraTo_gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SaveImageFromCameraToGallery(),
    );
  }
}
