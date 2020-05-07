import 'package:flutter/material.dart';

class Course extends ChangeNotifier{
  String _userId;
  String _courseId;
  String _courseName;
  String _teacher;
  String _major;
  String _department;
  TimeOfDay _startTime;
  TimeOfDay _endTime;
  int _maxWeek;

  String get userId => _userId;

  String get courseId => _courseId;

  String get courseName => _courseName;

  String get teacher => _teacher;

  String get major => _major;

  String get department => _department;

  TimeOfDay get startTime => _startTime;

  TimeOfDay get endTime => _endTime;

  int get maxWeek => _maxWeek;

  set maxWeek(int value) {
    _maxWeek = value;
  }

  set endTime(TimeOfDay value) {
    _endTime = value;
  }

  set startTime(TimeOfDay value) {
    _startTime = value;
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

  set userId(String value) {
    _userId = value;
  }


}