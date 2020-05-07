import 'package:flutter/material.dart';
import 'package:socialapp/model/hobby/hobby_model.dart';

class HobbyCounter extends ChangeNotifier{
  var _hobbyList = List<Hobby>();

  get hobbyList => _hobbyList;

  set hobbyList(value) {
    _hobbyList = value;
  }

  void addHobby(Hobby hobby) {
    _hobbyList.add(hobby);
    notifyListeners();
  }

}
