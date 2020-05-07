import 'package:flutter/material.dart';
import 'package:socialapp/model/course/course_model.dart';

class CourseCounter extends ChangeNotifier{
  var _courseList = List<Course>();

  get courseList => _courseList;

  set courseList(value) {
    _courseList = value;
  }

  void addCourse(Course course) {
    _courseList.add(course);
    notifyListeners();
  }

}