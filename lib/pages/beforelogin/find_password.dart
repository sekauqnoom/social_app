import 'package:flutter/material.dart';

class FindPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FindPasswordPageState();
}

class FindPasswordPageState extends State<FindPasswordPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("设置", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
      ),
      body:Text(""),
    );
  }
}