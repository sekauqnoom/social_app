import 'package:flutter/material.dart';
import 'dart:io';
import 'package:socialapp/model/shared_dynamics/dynamic_model.dart';

class DynamicCounter extends ChangeNotifier{
  List<Dynamic> _dynamicList = [
    Dynamic("可心", "今天的天好蓝呀","7月19日 13:27",'images/15.jpg',
        [Image.file(File('/storage/emulated/0/DCIM/Camera/IMG20200717132741.jpg'), width: 105, height: 105,)],
        [File('/storage/emulated/0/DCIM/Camera/IMG20200717132741.jpg'),]
    ),

    Dynamic("琪琪", "晚上出去兜风啦！","7月18日 22:24",'images/me.png',
        [Image.file(File('/storage/emulated/0/DCIM/Camera/IMG20200715222454.jpg'), width: 105, height: 105,)],
        [File('/storage/emulated/0/DCIM/Camera/IMG20200715222454.jpg'),]
    ),

    Dynamic("敖雪", "可以当壁纸的晚霞pic~","7月18日 19:03",'images/3.jpg',
        [Image.file(File('/storage/emulated/0/DCIM/Camera/IMG20200712191628.jpg'), width: 105, height: 105,)],
        [File('/storage/emulated/0/DCIM/Camera/IMG20200712191628.jpg'),]
    ),
  ];

//  var _dynamicList  = List<Dynamic>();

  get dynamicList => _dynamicList;

  set dynamicList(value) {
    _dynamicList = value;
  }

  void addDynamic(Dynamic dynamic) {
    _dynamicList.insert(0, dynamic);
    notifyListeners();
  }

}