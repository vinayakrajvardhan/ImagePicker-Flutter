import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class SaveImageFromCameraToGallery extends StatefulWidget {
  const SaveImageFromCameraToGallery({Key? key}) : super(key: key);

  @override
  State<SaveImageFromCameraToGallery> createState() =>
      _SaveImageFromCameraToGalleryState();
}

class _SaveImageFromCameraToGalleryState
    extends State<SaveImageFromCameraToGallery> {
  String firstButtonText = "Save Image to Gallery";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Image from camera to gallery '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(shape: StadiumBorder()),
              onPressed: saveImageToGallery,
              child: Text(
                firstButtonText,
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveImageToGallery() async {
    ImagePicker.platform.pickImage(source: ImageSource.camera).then((value) {
      if (value != null && value.path != null) {
        GallerySaver.saveImage(value.path).then((value) {
          setState(() {
            String firstButtonText = 'Image is saved to gallery';
          });
        });
      }
    });
  }
}
