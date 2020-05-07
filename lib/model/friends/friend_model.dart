import 'package:flutter/material.dart';

class Friend extends ChangeNotifier{
  String _userId;
  String _friendId;

  String get userId => _userId;

  String get friendId => _friendId;

  set friendId(String value) {
    _friendId = value;
  }

  set userId(String value) {
    _userId = value;
  }


}
