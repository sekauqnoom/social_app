import 'package:flutter/material.dart';
import 'package:socialapp/pages/afterlogin/message/chat_page.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  var name = '';
  var desc = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("消息", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
      ),
      body:new ListView.builder(
        itemBuilder: (context, i) {
          return getItem(i);
        },
        itemCount: 6,
      ),
    );
  }

  /// 这是一个获取每个条目的方法
  ///
  Widget getItem(int position) {
    switch (position) {
      case 0:
        name = 'Ai卓玛';
        desc = '你在干嘛呢';
        break;
      case 1:
        name = '李四';
        desc = '[你收到一个红包]';
        break;
      case 2:
        name = '王五';
        desc = '[图片]';
        break;
      case 3:
        desc = '[语音]';
        name = '丁柳';
        break;
      case 4:
        desc = '哈哈';
        name = 'List';
        break;
      case 5:
        desc = '好的';
        name = '张三';
        break;
    }
    return ChatListItem(position, name, desc);
  }
}

class ChatListItem extends StatefulWidget {
  int position;
  String name;
  String desc;

  ChatListItem(this.position, this.name, this.desc);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatListItemState(position, name, desc);
  }
}

class _ChatListItemState extends State<ChatListItem> {
  int position;
  String name;
  String desc;
  var defaultAvatar = 'images/ww_default_avatar.png';

  _ChatListItemState(this.position, this.name, this.desc);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              height: 60.0,
              margin: new EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
              child: GestureDetector(
                onTap: _toChatPage,
                child: new Row(
                children: <Widget>[
                  new Image.asset(defaultAvatar, width: 44.0, height: 44.0),
                  new Expanded(
                      child: new Container(
                          height: 40.0,
                          alignment: Alignment.centerLeft,
                          margin: new EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                '$name',
                                style: TextStyle(fontSize: 15.0),
                              ),
                              new Text(
                                '$desc',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: const Color(0xffaaaaaa)),
                              ),
                            ],
                          ))),
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                    child: new Text(
                      '13:30',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: const Color(0xffaaaaaa),
                      ),
                    ),
                  )
                ],
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
              height: 0.5,
              color: const Color(0xffebebeb),
            ),
          ],
        ),
    );
  }

  ///
  /// 跳转聊天界面
  ///
  ///
  _toChatPage() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new ChatPage(this.name)),
    );
  }
}