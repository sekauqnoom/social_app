import 'package:flutter/material.dart';
import 'package:socialapp/model/user/user_model.dart';

class UserCounter extends ChangeNotifier{
  var _userList = List<User>();
  set userList(List<User> userList) => this._userList = userList;
  List<User> get userList => _userList;

  void addUser(User user) {
    _userList.add(user);
    notifyListeners();
  }

}