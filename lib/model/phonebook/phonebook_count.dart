import 'package:flutter/material.dart';
import 'package:socialapp/model/phonebook/phonebook_model.dart';

class PhonebookCounter extends ChangeNotifier{
  var _phonebookList = List<Phonebook>();

  get phonebookList => _phonebookList;

  set phonebookList(value) {
    _phonebookList = value;
  }

  void addCourse(Phonebook phonebook) {
    _phonebookList.add(phonebook);
    notifyListeners();
  }

}
