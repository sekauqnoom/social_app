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
          url:
          defaultAvatar,
          name: "徐蒙多",
          startLetter: "X"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRun_G8_dzpbZ4C8vcg1JgdUtwHsAdax_RJLTqjgAYWDPZ_r1or",
          name: "JJ",
          startLetter: "J"),
      Friend(type: 1, url: null, name: "biao", startLetter: "B"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTQ66I7Z8V0nO5-pr4Ubd-HlM7WGJ78Mch-wszg1jx5UtOgeu7F",
          name: "移动端",
          startLetter: "Y"),
      Friend(type: 1, url: null, name: "Cling", startLetter: "C"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcREk_qXU3ZmiiiKVXmMJbUsKLHLFwHzJPIQsTG5__Egp_wS2qqF",
          name: "Go",
          startLetter: "G"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4hzXLbHh3WpNS2JPeDNGFrUxCy8G6q7ZhiEWch_rpsH-qjmlL",
          name: "考研",
          startLetter: "K"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSWhPmbTURlGR7Uw5eBPlXZnUEviQ6IPFOysANKNygCRMiGszFY",
          name: "James",
          startLetter: "J"),
      Friend(type: 1, url: null, name: "...", startLetter: "#"),
      Friend(type: 1, url: null, name: "齐天大圣", startLetter: "Q"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQs4Q6FnVBC2xzmzmryFs1pKkHZ8e2gOoRsE3UjLTme_jzF3mas",
          name: "西门庆",
          startLetter: "X"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR3HsH3q2LkXh_abUc_T7Nx-iNkCgRUus4yr8givvbvpah05X43",
          name: "Age",
          startLetter: "A"),
      Friend(type: 1, url: null, name: "花果山", startLetter: "H"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaXwwMnO760jdZUmWIcryDhNUL6iC-eA73kCKXRHbGfHXW_4_2",
          name: "Sky",
          startLetter: "S"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRQRNGE15zEjPG0iPMzszoSF15Gt1-P-BGQhLR9WXEnBhSPoU9c",
          name: "朋友",
          startLetter: "P"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTXLMYnpb-PMV0wPYf9L5kPJzgjSXvIfdJhhbQdLLlLieq8m5zA",
          name: "Java工程师",
          startLetter: "J"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQiH3mCzekL-nfaUlyUGZgNYZUrw6hZ16t94cAfbUMKwSYn2W3P",
          name: "Zyn",
          startLetter: "Z"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS4JMNLEU2hiDy8Ex5xG50ANgHZreOetVwNJKRqWiYrYJOm7mIr",
          name: "花花酱",
          startLetter: "H"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTiLwxp7JZwSWKzBH-bMufQqrhFJo8mFW93femb-Tc4oIxxRDqt",
          name: "赵四",
          startLetter: "Z"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQmXTcoRf6Iamd-VqKxYq_9OQaznMDt7gaR0NIooO56wFSm2syT",
          name: "哥哥",
          startLetter: "G"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQgdRIcVlZhKfaIxLwK6uISA449_Xy12X7P5qoDhTu8Yv61YLfx",
          name: "特别好的名字让朋友记住你",
          startLetter: "T"),
      Friend(
          type: 1,
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTG5_BNUtecugKy-_nc1CpAsV_px4MReS4qGED-1jY5UnjnTgcj",
          name: "。。。",
          startLetter: "#"),
    ];
  }
}
