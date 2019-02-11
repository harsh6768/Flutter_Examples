import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  File _image;
  
  //for getting the image
  Future getImage() async{
        var image=await ImagePicker.pickImage(source: ImageSource.camera);

        //setting the image state
        setState(()=> _image=image);

  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Camera Picker"),
        ),
        body:Container(
          height: 600,
          width: 600,
          child:Center(
            child: _image==null? Text("No images clicked"):Image.file(_image)
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.camera),
            tooltip: "Click Image",
            onPressed: (){

              //Calling getImage method to click the image from the camera
              getImage();
            },
          ),
        ),
    );
  }

}