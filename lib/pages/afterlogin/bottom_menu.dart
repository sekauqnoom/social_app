import 'package:flutter/material.dart';
import 'package:socialapp/pages/afterlogin/Home/home_page.dart';
import 'package:socialapp/pages/afterlogin/me/drawer.dart';
import 'package:socialapp/pages/afterlogin/course_table.dart';
import 'package:socialapp/pages/afterlogin/dynamics/dynamics.dart';
import 'package:socialapp/pages/afterlogin/message/message_list.dart';
import 'package:socialapp/pages/afterlogin/friends/contact_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BottomMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomMenuPageState();
}
//final _firestore = Firestore.instance;
//FirebaseUser loggedInUser;

int _currentIndex = 0;  //设置当前显示的页面索引

class BottomMenuPageState extends State<BottomMenuPage> with SingleTickerProviderStateMixin{
//  final _auth = FirebaseAuth.instance;

//  @override
//  void initState() {
//    super.initState();
//    getCurrentUser();
//  }
//  void getCurrentUser() async {
//    try {
//      final user = await _auth.currentUser();
//      if (user != null) {
//        loggedInUser = user;
//        print(loggedInUser.email);
//      }
//    } catch (e) {
//      print(e);
//    }
//  }

  @override
  Widget build(BuildContext context){
    List<Widget> viewList = [HomePage(), CoursePage(), MessagePage(), ContactPage(), DynamicsPage()];

    return Container(
      child: Scaffold(
        drawer: DrawerPage(),
        body: viewList[_currentIndex],
        bottomNavigationBar: SafeArea(
          child: BottomNavigationBar(
            selectedItemColor: Colors.deepPurpleAccent,
            items: [
              BottomNavigationBarItem(
//                icon: Image.asset("images/home.png",height: 36),
                icon: new Icon(Icons.home, size: 32,),
                title: Text("",style: TextStyle(color: Colors.blue),),
              ),

              BottomNavigationBarItem(
//                icon: Image.asset("images/course.png",height: 36),
                icon: new Icon(Icons.calendar_today),
                title: Text("",style: TextStyle(color: Colors.blue),),
              ),

              BottomNavigationBarItem(
//                icon: Image.asset("images/message.png",height: 36),
                icon: new Icon(Icons.chat_bubble),
                title: Text("",style: TextStyle(color: Colors.blue),),
              ),

              BottomNavigationBarItem(
//                icon: Image.asset("images/dynamic.png",height: 36),
                icon: new Icon(Icons.group, size: 28,),
                title: Text("",style: TextStyle(color: Colors.blue),),
              ),

              BottomNavigationBarItem(
//                icon: Image.asset("images/dynamic.png",height: 36),
                icon: new Icon(Icons.camera, size: 28,),
                title: Text("",style: TextStyle(color: Colors.blue),),
              ),

//              BottomNavigationBarItem(
//                icon: Image.asset("images/me.png",height: 36),
//                title: Text("",style: TextStyle(color: Colors.blue),),
//              ),
            ],
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,//设置类型
            //设置点击响应
            onTap: (int index){         //参数设置为默认的index，这个index就是点击的按钮的index
              setState(() {
                _currentIndex =index;
              });
            },
          ),
        ),
      ),
    );

  }
}