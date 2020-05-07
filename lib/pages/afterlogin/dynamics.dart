import 'package:flutter/material.dart';

class DynamicsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DynamicsPageState();
}

class DynamicsPageState extends State<DynamicsPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("好友动态", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
      ),
      body:Text(""),
    );
  }
}