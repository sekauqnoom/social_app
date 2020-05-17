import 'package:flutter/material.dart';

class Hobby extends ChangeNotifier{
  String _userId;
  hobby _content;

  String get userId => _userId;

  hobby get content => _content;

  set content(hobby value) {
    _content = value;
  }

  set userId(String value) {
    _userId = value;
  }


}

enum hobby{
  movie,
  sports,
  music,
  dance,
}