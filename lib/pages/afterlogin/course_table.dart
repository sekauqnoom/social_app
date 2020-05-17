import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CoursePageState();
}

class CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("我的课程", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("5月", style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
              Text("周一", style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
              Text("周二", style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
              Text("周三", style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
              Text("周四", style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
              Text("周五", style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
              Text("周六", style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
              Text("周日", style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),

            ],
          ),
        ],
      ),
    );
  }
}