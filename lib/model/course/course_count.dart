import 'package:flutter/material.dart';
import 'package:socialapp/model/course/course_model.dart';

class CourseCounter extends ChangeNotifier{
  var _courseList = List<Course>();

  get courseList => _courseList;

  set courseList(value) {
    _courseList = value;
  }

  void initCourseList(){
    _courseList.add(Course('1', '1', '计算机网络系统', '兰刚', '第二教学楼204', '软件工程', '信息与软件工程', 1, 1, '1-16周'));
    _courseList.add(Course('1', '1', '计算机网络系统', '兰刚', '第二教学楼204', '软件工程', '信息与软件工程', 3, 3, '1-16周'));
    _courseList.add(Course('1', '1', '计算机网络系统', '兰刚', '第二教学楼204', '软件工程', '信息与软件工程', 5, 1, '1-16周'));
    _courseList.add(Course('1', '2', '汇编语言程序设计', '赵洋', '第二教学楼103', '软件工程', '信息与软件工程', 1, 2, '1-16周'));
    _courseList.add(Course('1', '3', '操作系统基础', '刘瑶', '第二教学楼206', '软件工程', '信息与软件工程', 1, 3, '1-16周'));
    _courseList.add(Course('1', '3', '操作系统基础', '刘瑶', '第二教学楼206', '软件工程', '信息与软件工程', 3, 1, '1-16周'));
    _courseList.add(Course('1', '4', '现代密码学', '王煜宇', '第二教学楼106', '软件工程', '信息与软件工程', 3, 2, '1-15周(单周)'));
    _courseList.add(Course('1', '4', '现代密码学', '王煜宇', '第二教学楼106', '软件工程', '信息与软件工程', 5, 3, '1-16周'));
    _courseList.add(Course('1', '5', '考研英语', '蔡萍', '第二教学楼212', '软件工程', '信息与软件工程', 4, 2, '1-17周'));
    _courseList.add(Course('1', '6', '数据库原理及应用', '陈安龙', '第二教学楼106', '软件工程', '信息与软件工程', 5, 5, '1-16周'));
    _courseList.add(Course('1', '7', '器械健身D', '周川', '体育馆健身房', '软件工程', '信息与软件工程', 2, 3, '1-16周'));
    _courseList.add(Course('1', '8', '瑜伽', '张静果', '校医院住院部三楼芳华厅', '软件工程', '信息与软件工程', 2, 5, '1-13周'));
    _courseList.add(Course('1', '8', '瑜伽', '张静果', '校医院住院部三楼芳华厅', '软件工程', '信息与软件工程', 4, 5, '1-13周'));
  }
  void addCourse(Course course) {
    _courseList.add(course);
    notifyListeners();
  }
}