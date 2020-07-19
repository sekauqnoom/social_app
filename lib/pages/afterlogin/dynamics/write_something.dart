import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:async/async.dart';
import 'package:provider/provider.dart';

import 'package:socialapp/model/shared_dynamics/dynamic_model.dart';
import 'package:socialapp/model/shared_dynamics/dynamic_count.dart';

const int maxCount = 9;
enum PickImageType {
  gallery,
  camera,
}

class WritePage extends StatefulWidget {
  @override
  WritePageState createState() => WritePageState();
}

class WritePageState extends State<WritePage> {
  TextEditingController _textEditingController  = TextEditingController();
  List _images = []; //保存添加的图片(带有删除按钮的组件)
  List photos = [];   //Image组件
  List photoUrls = [];
  int currentIndex = 0;
  bool isDelete = false;
  String datetime;

  @override
  void initState() {
    super.initState();
    _images.add(UploadImageItem(
      callBack: (int i) {
        if (i == 0) {
          print('打开相机');
          _getImage(PickImageType.camera);
        } else {
          print('打开相册');
          _getImage(PickImageType.gallery);
        }
      },
    ));
  }

  @override
  void dispose() {
//    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          title: Text('发表动态'),
          actions: <Widget>[
            Consumer<DynamicCounter>(
              builder: (context, counter, child) => SizedBox(
                child: RaisedButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text('发表', style: TextStyle(fontSize: 16)),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: (){
                    if(_textEditingController.text != null || photos.length != 0){
                      if(DateTime.now().minute>=0 && DateTime.now().minute<10){
                        datetime = DateTime.now().month.toString()+'月'+DateTime.now().day.toString()+'日 '
                            +DateTime.now().hour.toString()+':0'+DateTime.now().minute.toString();
                      }
                      else{
                        datetime = DateTime.now().month.toString()+'月'+DateTime.now().day.toString()+'日 '
                            + DateTime.now().hour.toString()+':'+DateTime.now().minute.toString();
                      }

                      counter.addDynamic(Dynamic('我', _textEditingController.text, datetime, photos, photoUrls));
                      print('发表成功');
                      Navigator.pop(context);
                    }
                    else{
                      showDialog(
                          context: context,
                          builder: (_) =>
                              AlertDialog(
                                title: Text("Alert"),
                                content: Text("Failed to add a card!"),
                              )
                      );
                    }
                  },
                ),
                height: 32,
                width: 76,
              ),
            ),
          ],
        ),
        body: new SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(minHeight: 120.0,),
            child: Column(
              children: <Widget>[
                Container(
                  child: TextField(
                    controller: _textEditingController,
                    maxLength: 300,
                    maxLines: 5,
                    style: TextStyle(fontSize: 20.0),
                    keyboardType: TextInputType.multiline,    //多行文本
                    decoration: InputDecoration(
//                      icon: Container(
//                          padding: EdgeInsets.only(top: 0),
//                          child: Icon(Icons.edit)
//                      ),
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 13),
                      border: InputBorder.none,
                      hintText: "记录此刻的想法...",
//                      hintStyle: TextStyle(),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 14, left: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        runSpacing: 10,
                        spacing: 10,
                        children: List.generate(_images.length, (i) {
                          return _images[i];
                        }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
//          body: _getBody(),
    );
  }

  _getImage(PickImageType type) async {
    var image = await ImagePicker.pickImage(
        source: type == PickImageType.gallery
            ? ImageSource.gallery
            : ImageSource.camera);
    UploadImageItem();
    setState(() {
      print('add image at $currentIndex');
      _images.insert(
          _images.length - 1,
          UploadImageItem(
            imageModel: UploadImageModel(image, currentIndex),
            deleteFun: (UploadImageItem item) {
              print('remove image at ${item.imageModel.imageIndex}');
              bool result = _images.remove(item);
              print('left is ${_images.length}');
              if (_images.length == maxCount -1 && isDelete == false) {
                isDelete = true;
                _images.add(UploadImageItem(
                  callBack: (int i) {
                    if (i == 0) {
                      print('打开相机');
                      _getImage(PickImageType.camera);
                    } else {
                      print('打开相册');
                      _getImage(PickImageType.gallery);
                    }
                  },
                ));
              }
              print('remove result is $result');
              setState(() {});
            },
          ));
      photoUrls.add(image);
      print("photo's url: ");
      print(image);

      photos.add(Image.file(
        image,
        width: 105,
        height: 105,
      ));
      currentIndex++;
      if (_images.length == maxCount + 1) {
        _images.removeLast();
        isDelete = false;
      }
    });
  }

  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    UploadImageItem();
    setState(() {
      _images.insert(
          _images.length - 1,
          UploadImageItem(
            imageModel: UploadImageModel(image, currentIndex),
          ));
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _images.insert(
        _images.length - 1,
        UploadImageItem(
          imageModel: UploadImageModel(image, currentIndex),
        ));

    setState(() {});
  }
}

class UploadImageModel {
  final File imageFile;
  final int imageIndex;

  UploadImageModel(this.imageFile, this.imageIndex);
}

class UploadImageItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Function callBack;
  final UploadImageModel imageModel;
  final Function deleteFun;
  UploadImageItem({this.onTap, this.callBack, this.imageModel, this.deleteFun});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 115,
        height: 115,
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 8, right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xFFF0F0F0)),
                child: imageModel == null
                    ? InkWell(
                    onTap: onTap ??
                            () {
                          BottomActionSheet.show(context, [
                            '相机',
                            '相册',
                          ], callBack: (i) {
                            callBack(i);

                            return;
                          });
                        },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Image.asset('images/image_picker.png',),
                        ),
                        Text('上传', style: TextStyle(fontSize: 12, color: Color(0xff999999)),)
                      ],
                    ))
                    : Image.file(
                  imageModel.imageFile,
                  width: 105,
                  height: 105,
                )),
            Offstage(
              offstage: (imageModel == null),
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Image.asset(
                  'images/delete_pic.png',
                  width: 16.0,
                  height: 16.0,
                ),
                onTap: () {
                  print('点击了删除');
                  if (imageModel != null) {
                    deleteFun(this);
                  }
                },
              ),
            ),
          ],
        ));
  }
}

class BottomActionSheet {
  static show(BuildContext context, List<String> data,
      {String title, Function callBack(int)}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              color: Color.fromRGBO(114, 114, 114, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //为了防止控件溢出
                  Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.all(Radius.circular(14)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            title != null
                                ? Container(
                              height: 40,
                              alignment: Alignment.center,
                              child: new Text(
                                title,
                                textAlign: TextAlign.center,
                              ),
                            )
                                : Container(),
                            Divider(
                              height: 1,
                              color: Color(0xFF3F3F3F),
                            ),
                            Flexible(
                                child: ListView.builder(
                                  /**
                                      If you do not set the shrinkWrap property, your ListView will be as big as its parent.
                                      If you set it to true, the list will wrap its content and be as big as it children allows it to be. */
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: <Widget>[
                                        new ListTile(
                                          onTap: () {
                                            //点击取消 弹层消失
                                            Navigator.pop(context);
                                            callBack(index);
                                          },
                                          title: new Text(
                                            data[index],
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        index == data.length - 1
                                            ? Container()
                                            : Divider(
                                          height: 1,
                                          color: Color(0xFF3F3F3F),
                                        ),
                                      ],
                                    );
                                  },
                                )),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                    height: 56,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.all(Radius.circular(14)),
                    ),
                    child: InkWell(
                      onTap: () {
                        //点击取消 弹层消失
                        Navigator.pop(context);
                      },
                      child: Text('取消',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Color(0xFF007AFF),
                            fontSize: 17.0,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}