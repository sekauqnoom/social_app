import 'package:flutter/material.dart';

class Dynamic extends ChangeNotifier{
  String _userId;
  String _content;
  dynamicType _type;

  String get userId => _userId;

  String get content => _content;

  dynamicType get type => _type;

  set type(dynamicType value) {
    _type = value;
  }

  set content(String value) {
    _content = value;
  }

  set userId(String value) {
    _userId = value;
  }


}
enum dynamicType{
  image,
  text,
  link
}