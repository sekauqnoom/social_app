import 'package:flutter/material.dart';

class Contact extends ChangeNotifier{
  String _userId;
  String _friendTel;

  String get userId => _userId;

  String get friendTel => _friendTel;

  set friendTel(String value) {
    _friendTel = value;
  }

  set userId(String value) {
    _userId = value;
  }


}