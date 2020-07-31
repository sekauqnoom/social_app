import 'package:flutter/material.dart';

var defaultAvatar = 'images/me.png';

class Friend extends ChangeNotifier{
  String _userId;
  String _friendId;
  String url;
  int type;
  String name;
  String startLetter;

  String get userId => _userId;

  String get friendId => _friendId;

  set friendId(String value) {
    _friendId = value;
  }

  set userId(String value) {
    _userId = value;
  }

  Friend({this.type, this.url, this.name,this.startLetter});

}

class ContactApi{
  static List<Friend> mock(){
    return [
      Friend(type: 1, url: null, name: "Flower", startLetter: "F"),
      Friend(
          type: 1,
          url: null,
          name: "徐蒙多",
          startLetter: "X"),
      Friend(
          type: 1,
          url:
          "images/1.jpg",
          name: "JJ",
          startLetter: "J"),
      Friend(type: 1, url: null, name: "白一凡", startLetter: "B"),
      Friend(
          type: 1,
          url:
          "images/2.jpg",
          name: "杨帆",
          startLetter: "Y"),
      Friend(type: 1, url: null, name: "菜菜", startLetter: "C"),
      Friend(
          type: 1,
          url:
          "images/15.jpg",
          name: "可心",
          startLetter: "K"),
      Friend(
          type: 1,
          url:
          "images/8.jpg",
          name: "嘉佳学姐",
          startLetter: "J"),
      Friend(type: 1, url: null, name: "...", startLetter: "#"),
      Friend(type: 1, url: null, name: "琪琪", startLetter: "Q"),
      Friend(
          type: 1,
          url:
          "images/4.jpg",
          name: "小郑",
          startLetter: "X"),
      Friend(
          type: 1,
          url:
          "images/3.jpg",
          name: "敖雪",
          startLetter: "A"),
      Friend(type: 1, url: null, name: "黄梦", startLetter: "H"),
      Friend(
          type: 1,
          url:
          "images/5.jpg",
          name: "Sky",
          startLetter: "S"),
      Friend(
          type: 1,
          url:
          "images/6.jpg",
          name: "pp",
          startLetter: "P"),
      Friend(
          type: 1,
          url:
          "images/7.jpg",
          name: "嘉琦",
          startLetter: "J"),
      Friend(
          type: 1,
          url:
          "images/10.jpg",
          name: "Zyn",
          startLetter: "Z"),
      Friend(
          type: 1,
          url:
          "images/11.jpg",
          name: "花花酱",
          startLetter: "H"),
      Friend(
          type: 1,
          url:
          "images/12.jpg",
          name: "张文",
          startLetter: "Z"),
      Friend(
          type: 1,
          url:
          "images/14.jpg",
          name: "唐希",
          startLetter: "T"),
      Friend(
          type: 1,
          url:
          "images/16.jpg",
          name: "。。。",
          startLetter: "#"),
    ];
  }
}
