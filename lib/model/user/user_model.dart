import 'package:flutter/material.dart';

/// This is the User Model for [LoginPage] to use.
/// When the user wants to login or register, it may use this [User] Model.

class User extends ChangeNotifier {
  String _userId;
  String _password;
  String _mail;
  String _tel;

  String _name;
  String _gender;
  DateTime _birthday;
  String _emotionalState;

  String _sno;
  int _enrollYear;
  String _department;
  String _major;


  String get userId => _userId;
  String get password => _password;
  String get mail => _mail;
  String get tel => _tel;
  String get name => _name;
  String get gender => _gender;
  DateTime get birthday => _birthday;
  String get emotionalState => _emotionalState;
  String get sno => _sno;
  int get enrollYear => _enrollYear;
  String get department => _department;
  String get major => _major;

  set userId(String value) {
    _userId = value;
  }

  set password(String value) {
    _password = value;
  }

  set mail(String value) {
    _mail = value;
  }

  set tel(String value) {
    _tel = value;
  }

  set name(String value) {
    _name = value;
  }

  set gender(String value) {
    _gender = value;
  }

  set birthday(DateTime value) {
    _birthday = value;
  }

  set emotionalState(String value) {
    _emotionalState = value;
  }

  set sno(String value) {
    _sno = value;
  }

  set enrollYear(int value) {
    _enrollYear = value;
  }

  set department(String value) {
    _department = value;
  }

  set major(String value) {
    _major = value;
  }
  User([this._userId, this._password]);

  //this part is for JSON data received
  static const String _ID_JSON = "Id";
  static const String _Mail_JSON = "Mail";
  static const String _PASSWORD_JSON = "Password";
  static const String _TEL_JSON = "Tel";
  static const String _NAME_JSON = "name";
  static const String _GENDER_JSON = "gender";
  static const String _BIRTHDAY_JSON = "birthday";
  static const String _EMOSTATE_JSON = "emotionalstate";
  static const String _SNO_JSON = "";
  static const String _ENROLLYEAR_JSON = "";
  static const String _DEPARTMENT_JSON = "";
  static const String _MAJOR_JSON = "";

  User.fromJson(Map<String, dynamic> json) {
    _userId = json[_ID_JSON];
    _password = json[_PASSWORD_JSON];
    _mail = json[_Mail_JSON];
    _tel = json[_TEL_JSON];
    _name = json[_NAME_JSON];
    _gender = json[_GENDER_JSON];
    _birthday = json[_BIRTHDAY_JSON];
    _emotionalState = json[_EMOSTATE_JSON];
    _sno = json[_SNO_JSON];
    _enrollYear = json[_ENROLLYEAR_JSON];
    _department = json[_DEPARTMENT_JSON];
    _major = json[_MAJOR_JSON];
  }

  Map<String, dynamic> toJson() {
    var user = <String, dynamic>{
      _ID_JSON: _userId,
      _PASSWORD_JSON: _password,
      _Mail_JSON: _mail,
    };
    return user;
  }
}
