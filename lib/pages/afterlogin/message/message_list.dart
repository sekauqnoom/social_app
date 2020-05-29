import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'package:socialapp/pages/afterlogin/message/chat_page.dart';
import 'package:socialapp/model/chat_model.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage>{
  List<ChatModel> _chatModels = [];

  @override
  void initState() {
    super.initState();

    /// 模拟数据
    _chatModels.addAll(Messages.mock());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    _chatModels.forEach((o) {
      list.add(_chatItem(o.avatar, o.name, o.lastMsg, o.time,
          isBadge: Random().nextBool()));
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("消息", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
      ),
      body: Column(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Expanded(
                  child: ListView(
                    children: list,
                  )))
        ],
      ),
    );
  }

  /// 多个ListTile组成聊天页ListView
  _chatItem(String imgUrl, String name, String lastMsg, String time,
      {bool isBadge = false}) {
    return Column(children: <Widget>[
      ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatPage(name)));
        },
        leading: Container(
          height: 43,
          width: 43,
          child: Stack(children: <Widget>[
            Positioned(
                left: 0,
                bottom: 0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      imgUrl ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcStSJPuGbyKL4NnEPTuyumS9CkheNYQdmpLwHW5VJ1kOCCoUpj9",
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ))),
            isBadge == true
                ? Positioned(
              right: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.fromBorderSide(
                        BorderSide(width: 1, color: Colors.red[600]))),
                child: Container(
                  color: Colors.red[600],
                  height: 6,
                  width: 6,
                ),
              ),
            )
                : Container()
          ]),
        ),
        title: Container(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            maxLines: 1,
          ),
        ),
        subtitle: Container(
          child: Text(
            lastMsg,
            style: TextStyle(color: Colors.grey, fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: Container(
          child: Text(
            time,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ),
      Divider(
        height: 1,
        color: Colors.grey[400],
        indent: 70,
      ),
    ]);
  }

}
//class MessagePageState extends State<MessagePage> {
//  var name = '';
//  var desc = '';
//
//  @override
//  Widget build(BuildContext context){
//    return Scaffold(
//      appBar: AppBar(
//        automaticallyImplyLeading: false,
//        title: Text("消息", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
//      ),
//      body:new ListView.builder(
//        itemBuilder: (context, i) {
//          return getItem(i);
//        },
//        itemCount: 6,
//      ),
//    );
//  }
//
//  /// 这是一个获取每个条目的方法
//  ///
//  Widget getItem(int position) {
//    switch (position) {
//      case 0:
//        name = 'Ai卓玛';
//        desc = '你在干嘛呢';
//        break;
//      case 1:
//        name = '李四';
//        desc = '[你收到一个红包]';
//        break;
//      case 2:
//        name = '王五';
//        desc = '[图片]';
//        break;
//      case 3:
//        desc = '[语音]';
//        name = '丁柳';
//        break;
//      case 4:
//        desc = '哈哈';
//        name = 'List';
//        break;
//      case 5:
//        desc = '好的';
//        name = '张三';
//        break;
//    }
//    return ChatListItem(position, name, desc);
//  }
//}
//
//class ChatListItem extends StatefulWidget {
//  int position;
//  String name;
//  String desc;
//
//  ChatListItem(this.position, this.name, this.desc);
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _ChatListItemState(position, name, desc);
//  }
//}
//
//class _ChatListItemState extends State<ChatListItem> {
//  int position;
//  String name;
//  String desc;
//  var defaultAvatar = 'images/ww_default_avatar.png';
//
//  _ChatListItemState(this.position, this.name, this.desc);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Container(
//        child: new Column(
//          children: <Widget>[
//            new Container(
//              height: 60.0,
//              margin: new EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
//              child: GestureDetector(
//                onTap: _toChatPage,
//                child: new Row(
//                children: <Widget>[
//                  new Image.asset(defaultAvatar, width: 44.0, height: 44.0),
//                  new Expanded(
//                      child: new Container(
//                          height: 40.0,
//                          alignment: Alignment.centerLeft,
//                          margin: new EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
//                          child: new Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              new Text(
//                                '$name',
//                                style: TextStyle(fontSize: 15.0),
//                              ),
//                              new Text(
//                                '$desc',
//                                style: TextStyle(
//                                    fontSize: 12.0,
//                                    color: const Color(0xffaaaaaa)),
//                              ),
//                            ],
//                          ))),
//                  new Padding(
//                    padding: new EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
//                    child: new Text(
//                      '13:30',
//                      style: TextStyle(
//                        fontSize: 10.0,
//                        color: const Color(0xffaaaaaa),
//                      ),
//                    ),
//                  )
//                ],
//                ),
//              ),
//            ),
//            new Container(
//              margin: new EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
//              height: 0.5,
//              color: const Color(0xffebebeb),
//            ),
//          ],
//        ),
//    );
//  }
//
//  ///
//  /// 跳转聊天界面
//  ///
//  ///
//  _toChatPage() {
//    Navigator.push(
//      context,
//      new MaterialPageRoute(builder: (context) => new ChatPage(this.name)),
//    );
//  }
//}