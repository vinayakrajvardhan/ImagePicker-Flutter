import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  XFile? _image;

  Future<void> pickImageFromCamera() async {
    ImagePicker _imagePicker = ImagePicker();
    XFile? _imagePickedFromCamera =
        await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = _imagePickedFromCamera;
    });
  }

  Future<void> pickImageFromGallery() async {
    ImagePicker _imagePicker = ImagePicker();
    XFile? _imagePickedFromGallery =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = _imagePickedFromGallery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: _image == null
                ? Container()
                : Image.file(
                    File(_image!.path),
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: pickImageFromCamera,
                child: Icon(
                  Icons.camera_alt_rounded,
                  size: 30,
                ),
              ),
              ElevatedButton(
                onPressed: pickImageFromGallery,
                child: Icon(
                  Icons.image,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          _image != null
              ? ElevatedButton(
                  onPressed: () {
                    if (_image != null) {
                      Share.shareFiles([_image!.path]);
                    }
                  },
                  child: Text('Share the Pictures'),
                )
              : Container(),
        ],
      ),
    );
  }
}
