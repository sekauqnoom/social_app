import 'package:flutter/material.dart';
import 'package:socialapp/model/shared_dynamics/dynamic_model.dart';

class DynamicCounter extends ChangeNotifier{
  var _dynamicList = List<Dynamic>();

  get dynamicList => _dynamicList;

  set dynamicList(value) {
    _dynamicList = value;
  }

  void addDynamic(Dynamic dynamic) {
    _dynamicList.add(dynamic);
    notifyListeners();
  }

}