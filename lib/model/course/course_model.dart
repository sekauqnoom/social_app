import 'package:flutter/material.dart';

class Course extends ChangeNotifier{
  String _sno;
  String _courseId;
  String _courseName;
  String _teacher;
  String _classRoom;
  String _major;
  String _department;  //系别
  int _classTime; //节次,如1-2节课就是第一节次
  int _weekday;  //周几的课
  String _week;  //周数，如1-16

  String get sno => _sno;
  String get courseId => _courseId;
  String get courseName => _courseName;
  String get teacher => _teacher;
  String get major => _major;
  String get department => _department;
  int get classTime => _classTime;
  String get classRoom => _classRoom;
  int get weekday => _weekday;
  String get week => _week;

  set sno(String value) {
    _sno = value;
  }

  set week(String value) {
    _week = value;
  }

  set weekday(int value) {
    _weekday = value;
  }

  set classRoom(String value) {
    _classRoom = value;
  }


  set department(String value) {
    _department = value;
  }

  set major(String value) {
    _major = value;
  }

  set teacher(String value) {
    _teacher = value;
  }

  set courseName(String value) {
    _courseName = value;
  }

  set courseId(String value) {
    _courseId = value;
  }


  set classTime(int value) {
    _classTime = value;
  }


  Course(this._sno, this._courseId, this._courseName, this._teacher,
      this._classRoom, this._major, this._department, this._weekday,
      this._classTime, this._week);

}