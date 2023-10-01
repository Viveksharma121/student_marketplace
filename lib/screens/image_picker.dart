import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    var pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              "Upload images",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Column(
            children: [
              Stack(
                children: [
                  // if (_image != null)
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child: _image == null
                          ? const Icon(
                        Icons.photo_library_rounded,
                        color: Colors.grey,
                      )
                          : Image.file(_image!),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.cancel, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          // _image = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //saving to db logic
                    },
                    child: Text("Save"),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //deleting from db
                    },
                    child: Text("Delete"),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: getImage,
                      child: Text("Upload Image"),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}