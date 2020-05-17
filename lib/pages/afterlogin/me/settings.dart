import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        title: Text("设置", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
      ),
      body:Text(""),
    );
  }
}