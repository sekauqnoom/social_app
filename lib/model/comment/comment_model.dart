import 'package:flutter/material.dart';

class Comment extends ChangeNotifier{
  String _userId;
  String _reviewerId;
  String _content;

  String get userId => _userId;

  String get reviewerId => _reviewerId;

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  set reviewerId(String value) {
    _reviewerId = value;
  }

  set userId(String value) {
    _userId = value;
  }

}