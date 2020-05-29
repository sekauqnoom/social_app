import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  String nikeName;
  String inputValue;
  ChatPage(this.nikeName);
  @override
  State<StatefulWidget> createState() => ChatPageState(nikeName);
}

class ChatPageState extends State<ChatPage> {
  String nikeName;
  String inputValue = 'ces';
  ChatPageState(this.nikeName);
  TextEditingController textEditingController = new TextEditingController();
  List<ChatItem> items = new List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: new Text(
              this.nikeName,
              style: TextStyle(color: Colors.white),
            )),
        body: Container(
          child: Column(
            children: <Widget>[
              new Expanded(
                  child: new ListView.builder(
                    itemBuilder: (context, i) {
                      return ChatListView(items[i]);
                    },
                    itemCount: items.length,
                  )),
              new Container(
                height: 60,
                child: Container(
                  child: Row(
                    children: <Widget>[
//                      Expanded(
//                        flex: 1,
//                        child: Container(
//                          margin: EdgeInsets.only(left: 10),
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(14),
//                            border: Border.fromBorderSide(BorderSide(width: 2)),
//                          ),
//                          child: Icon(
//                            Icons.keyboard_voice,
//                            color: Colors.black,
//                            size: 25,
//                          ),
//                        ),
//                      ),
                      Expanded(
                          flex: 7,
                          child: Container(
                            height: 40,
                            padding: EdgeInsets.only(top: 5, bottom: 5,),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: TextField(
                              controller: textEditingController,
                              onChanged: _onInputTextChange,

                              autofocus: false,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 13),
                                  border: InputBorder.none,
                                  hintText: '请输入内容',
                                  hintStyle: TextStyle(fontSize: 15,)
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 2,
                        child: FlatButton(
                          color: Colors.blue,
                          disabledTextColor: Colors.blue,
                          child: new Text('发送'),
                          onPressed: _sendMsg,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  _onInputTextChange(String value) {
    inputValue = value;
  }

  void _sendMsg() {
    print('发送消息');
    ChatItem chatItem = new ChatItem();
    chatItem.msg = inputValue;
    chatItem.type = 0;
    ChatItem chatItem2 = new ChatItem();
    chatItem2.msg = getoutValue(inputValue);
    chatItem2.type = 1;
    setState(() {
      this.items.add(chatItem);
      this.items.add(chatItem2);
    });
    textEditingController.clear();
  }

  ///
  /// Ai核心代码,价值无限
  ///
  ///
  getoutValue(String inputValue) {
    String value = inputValue;
    value = value.replaceAll('我', '你');
    value = value.replaceAll('吗', '');
    value = value.replaceAll('?', '!');
    value = value.replaceAll('？', '!');
    return value;
  }
}

class ChatItem {
  var msg;
  int type;

  String getMsg() {
    return msg;
  }
}

class ChatListView extends StatefulWidget {
  ChatItem item;

  ChatListView(this.item);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatListViewState(item);
  }
}

class _ChatListViewState extends State<ChatListView> {
  ChatItem item;
  var defaultAvatar = 'images/me.png';

  _ChatListViewState(this.item);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getItem();
  }

  Widget getItem() {
    if (item.type == 0) {
      return new Container(
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: Container(
                    child: new Text(
                      item.msg,
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(
                        color: Colors.grey,
//                width: 5.0,
                        style: BorderStyle.solid
                    ),
                  ),
                ),
              ),
              new Image.asset(defaultAvatar, width: 36.0, height: 36.0),
            ],
          ),
      );
    } else {
      return new Container(
        child: new Row(
          children: <Widget>[
            new Image.asset(defaultAvatar, width: 36.0, height: 36.0),
            new Expanded(
                child: Container(
                  child: Text(
                  item.msg,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(
                        color: Colors.grey,
//                width: 5.0,
                        style: BorderStyle.solid
                    ),
                  ),
                )
            )
          ],
        ),
      );
    }
  }
}