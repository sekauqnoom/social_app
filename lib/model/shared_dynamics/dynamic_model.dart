import 'package:flutter/material.dart';

class Dynamic extends ChangeNotifier{
  String _userName;
  String _text;
//  dynamicType _type;
  List _images;
  List _imageUrls;
  String _dateTime;

  List get imageUrls => _imageUrls;
  String get text => _text;
  List get images => _images;
  String get dateTime => _dateTime;


  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  set imageUrls(List value) {
    _imageUrls = value;
  }

  set dateTime(String value) {
    _dateTime = value;
  }

  Dynamic(this._userName, this._text, this._dateTime, this._images, this._imageUrls);

  set text(String value) {
    _text = value;
  }

  set images(List value) {
    _images = value;
  }
//  dynamicType get type => _type;
//
//  set type(dynamicType value) {
//    _type = value;
//  }

}
enum dynamicType{
  image,
  text,
  link
}