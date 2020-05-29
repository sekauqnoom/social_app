import 'package:flutter/material.dart';
import 'package:socialapp/model/contact/contact_model.dart';

class ContactCounter extends ChangeNotifier{
  var _contactList = List<Contact>();

  get contactList => _contactList;

  set contactList(value) {
    _contactList = value;
  }

  void addCourse(Contact contact) {
    _contactList.add(contact);
    notifyListeners();
  }

}
