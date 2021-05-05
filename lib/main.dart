import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';
import 'package:text_size/custom_text.dart';
import 'package:text_size/middle.dart';

import 'bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _picker = ImagePicker();
  var imageSize, imageHeightWidth, rawImageSize, rawImageHeightWidth;

  Future getImage() async{
    final pickedImage = await _picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500,
    );
    var imgSize = await File(pickedImage.path).length();
    setState(() {
      imageSize = imgSize;
      imageHeightWidth = ImageSizeGetter.getSize(FileInput(File(pickedImage.path)));
    });

    GallerySaver.saveImage(pickedImage.path);
  }

  Future getRawImage() async{
    final rawPickedImage = await _picker.getImage(
      source: ImageSource.gallery,
    );
    var rawImgSize = await File(rawPickedImage.path).length();
    setState(() {
      rawImageSize = rawImgSize;
      rawImageHeightWidth = ImageSizeGetter.getSize(FileInput(File(rawPickedImage.path)));
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    Future.delayed(Duration(milliseconds: 3), () async{
      print("future delayed duration one");
    });
    Future.delayed(() async{
      print("future delayed duration zero");
    });



    SchedulerBinding.instance.addPostFrameCallback((_) {
      print("SchedulerBinding");
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("WidgetsBinding");
    });


    print("after");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Compression Testing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Raw",
              style: TextStyle(fontSize: 25),),

            SizedBox(height: 10,),

            Text(
              "Image size: $rawImageSize bytes",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Text(
              "Image width and height: $rawImageHeightWidth",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              ),
            ),

            SizedBox(height: 50,),

            Text("After modifications",
            style: TextStyle(fontSize: 25),),

            SizedBox(height: 10,),

            Text(
              "Image size: $imageSize bytes",style: TextStyle(
              fontSize: 22,
            ),
            ),
            Text(
              "Image width and height: $imageHeightWidth",

              textAlign: TextAlign.center,style: TextStyle(
              fontSize: 22,
            ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          SizedBox(width: 20),
          FloatingActionButton(
            child: Text("M"),
            onPressed: getImage,
          ),
          Spacer(),
          FloatingActionButton(
            child: Text("R"),
            onPressed: getRawImage,
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
