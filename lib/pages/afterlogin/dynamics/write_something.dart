import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//import 'imagePicker.dart';
//import 'camera_screen.dart';
//import 'package:camera/camera.dart';

class WritePage extends StatefulWidget {
//  final String orderNo; //退车单号
//  final String customerName; // 客户名
//  const WritePage({Key key, this.orderNo, this.customerName})
//      : super(key: key);
  @override
  WritePageState createState() => WritePageState();
}

class WritePageState extends State<WritePage> {
//  TextEditingController _licenseController = new TextEditingController();
//  TextEditingController _kmController = new TextEditingController();
//  final FocusNode _nodeLicense = FocusNode();
//  final FocusNode _nodeKm = FocusNode();
//  Widget _getBody() {
//    return Container(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            Expanded(
//                child: ListView(
//                  children: <Widget>[
//
//                    SizedBox(
//                      height: 10,
//                    ),
//                    UcarImagePicker(
//                      maxCount: 3,
//                      title: '上传图片测试1',
//                    ),
//                    Divider(
//                      height: 1,
//                    ),
//                    UcarImagePicker(
//                      maxCount: 5,
//                      title: '上传图片测试222',
//                    ),
//                  ],
//                )),
//            SafeArea(
//              child: MaterialButton(
//                height: 46,
//                color: Color(0xFFF12E49),
//                textColor: Colors.white,
//                child: Text(
//                  "立即开始",
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 15.0,
//                  ),
//                ),
//                onPressed: ()  async {
//                  final cameras = await availableCameras();
//
//                  // Get a specific camera from the list of available cameras.
//                  final firstCamera = cameras.first;
//                  Navigator.push(context, MaterialPageRoute(
//                      builder: (context) {
//                        return TakePictureScreen(camera:firstCamera,);
//                      }
//                  ));
//                },
//              ),
//            )
//          ],
//        ));
//  }
//
//  _listener() {
//
//    print("${_kmController.text}");
//    print("${_licenseController.text}");
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _licenseController.addListener(_listener);
//    _kmController.addListener(_listener);
//  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
            body: Text(''),

//          body: _getBody(),
        ));
  }
}