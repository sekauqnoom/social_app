import 'package:flutter/material.dart';
import 'package:socialapp/pages/afterlogin/Home/home_page.dart';
import 'package:socialapp/pages/afterlogin/course_table.dart';
import 'package:socialapp/pages/afterlogin/dynamics.dart';
import 'package:socialapp/pages/afterlogin/message/message_list.dart';

class BottomMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomMenuPageState();
}

int _currentIndex = 0;  //设置当前显示的页面索引

class BottomMenuPageState extends State<BottomMenuPage> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    List<Widget> viewList = [HomePage(), DynamicsPage(), CoursePage(), MessagePage()];

    return Container(
      child: Scaffold(
        body: viewList[_currentIndex],
        bottomNavigationBar: SafeArea(
          child: BottomNavigationBar(
            selectedItemColor: Colors.deepPurpleAccent,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset("images/home.png",height: 36),
                title: Text("",style: TextStyle(color: Colors.blue),),
              ),
              BottomNavigationBarItem(
                icon: Image.asset("images/dynamic.png",height: 36),
                title: Text("",style: TextStyle(color: Colors.blue),),
              ),
              BottomNavigationBarItem(
                icon: Image.asset("images/course.png",height: 36),
                title: Text("",style: TextStyle(color: Colors.blue),),
              ),
              BottomNavigationBarItem(
                icon: Image.asset("images/message.png",height: 36),
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