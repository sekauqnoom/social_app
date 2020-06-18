import 'package:flutter/material.dart';

class Dynamic extends ChangeNotifier{
  String _userId;
  String _text;
//  dynamicType _type;
  List _images;
  List _imageUrls;
  String _dateTime;

  List get imageUrls => _imageUrls;
  String get userId => _userId;
  String get text => _text;
  List get images => _images;
  String get dateTime => _dateTime;


  set imageUrls(List value) {
    _imageUrls = value;
  }

  set dateTime(String value) {
    _dateTime = value;
  }

  Dynamic(this._userId, this._text, this._dateTime, this._images, this._imageUrls);

  set text(String value) {
    _text = value;
  }

  set userId(String value) {
    _userId = value;
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