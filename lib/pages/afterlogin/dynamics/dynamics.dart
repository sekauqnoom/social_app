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
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            new PopupMenuButton(
              offset: const Offset(0.0, 60.0),
              icon: new Icon(Icons.add, color: Colors.white),
              onSelected: (int value) {
                startMenuButton(value,context);
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                new PopupMenuItem<int>(
                    value: 0,
                    child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
//                                    new Image.asset(group, width: 30.0, height: 30.0),
                                new Icon(Icons.add_a_photo, color: Colors.black,),
                                new Text('  发布心情',
                                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                                )
                              ],
                            ),
                          ],
                        ))),
              ],
            ),
          ]
      ),
      body:Text(""),
    );
  }

  ///
  /// 菜单按钮点击的事件
  ///
  startMenuButton(int value, BuildContext context) {
    switch (value) {
      case 0:
        Navigator.pushNamed(context, "/writeSomething");
        break;
      case 1:
        break;
      case 2:
//        startScan();
        break;
      case 3:
        break;
    }
  }
}