import 'package:flutter/material.dart';
import 'package:socialapp/model/friends/friend_model.dart';

class FriendCounter extends ChangeNotifier{
  var _friendList = List<Friend>();

  get friendList => _friendList;

  set friendList(value) {
    _friendList = value;
  }

  void addFriend(Friend friend) {
    _friendList.add(friend);
    notifyListeners();
  }

}
