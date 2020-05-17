import 'package:flutter/material.dart';

//左侧菜单栏
class DrawerPage extends Drawer {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      //侧边栏按钮Drawer
      child: new ListView(
        children: <Widget>[
          //个人信息部分
          new Container(
              color: Color.fromARGB(255, 119, 136, 213),
              child: new Padding(
                padding: new EdgeInsets.all(26.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        //头像
                        new Container(
                          width: 80.0,
                          height: 80.0,
                          margin: EdgeInsets.only(right: 10.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/me.png"),
                              fit: BoxFit.fitHeight,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              '用户名',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                            new Text(
                              '学号',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )),
          new ListTile(
              title: new Text('编辑个人资料'),
              leading: new Icon(Icons.edit),
              onTap: () {
                Navigator.pushNamed(context, "/editInfo", );
              }),
          //分割线控件
          new ListTile(
              title: new Text('设置'),
              leading: new Icon(Icons.settings),
              onTap: () {
                Navigator.pushNamed(context, "/settings", );
              } //点击后收起侧边栏
          ),
          //分割线控件
          new ListTile(
              title: new Text('退出登录'),
              leading: new Icon(Icons.sync),
              onTap: () {
                logOutDialog(context);
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("成功退出登录"),
                ));
              } //点击后收起侧边栏
          ),
          //分割线控件
          new ListTile(
            //第二个功能项
              title: new Text('关于我们'),
              leading: new Icon(Icons.accessibility),
              onTap: () {
                Navigator.of(context).pop();
              }),
          //分割线控件
        ],
      ),
    );
  }

  void logOutDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('确定退出登录?'),
            title: Center(
                child: Text(
                  '您将会回到登陆页面',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "/loginPage", (route) => route == null
                    );
                  },
                  child: Text('是')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('否')),
            ],
          );
        });
  }
}


//import 'package:flutter/material.dart';
//
//class DrawerPage extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => DrawerPageState();
//}
//
//class DrawerPageState extends State<DrawerPage> {
//  @override
//  Widget build(BuildContext context){
//    return Scaffold(
//      appBar: AppBar(
//        automaticallyImplyLeading: false,
//        title: Text("我", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
//      ),
//      body:Text(""),
//    );
//  }
//}