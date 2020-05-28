import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  String nikeName;
  String inputValue;
  ChatPage(this.nikeName);
  @override
  State<StatefulWidget> createState() => ChatPageState(nikeName);
}

class ChatPageState extends State<ChatPage> {
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
              new Divider(
                height: 5,
              ),
              new SafeArea(
                child: Container(
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new TextField(
                            decoration: new InputDecoration(
                              hintText: '    请输入内容',
                            ),
                            maxLength: 200,
                            onChanged: _onInputTextChange,
                            controller: textEditingController,
                          )),
                      new FlatButton(
                        color: Colors.blue,
                        disabledTextColor: Colors.blue,
                        child: new Text('发送'),
                        onPressed: _sendMsg,
                      )
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
      return Column(
        children: <Widget>[
          new Container(
//          height: 100,
              width: MediaQuery.of(context).size.width * 0.9,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Expanded(
                    child: new Container(
//                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: new Text(
                        item.msg,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  new Image.asset(defaultAvatar, width: 44.0, height: 44.0),
                ],
              )
          ),
          new Divider(
            height: 5,
          )
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Image.asset(defaultAvatar, width: 44.0, height: 44.0),
                new Expanded(
                    child: Container(
                      child: new Text(
                        item.msg,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.red),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                    ),
                )
              ],
            ),
          ),
          new Divider(
            height: 5,
          )
        ],
      );
    }
  }
}