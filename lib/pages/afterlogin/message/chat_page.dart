import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  String nikeName;
  String imgUrl;
  String lastMsg;
  ChatPage(this.imgUrl,this.nikeName, this.lastMsg);

  String inputValue;

  @override
  State<StatefulWidget> createState() => ChatPageState(imgUrl, nikeName, lastMsg);
}

class ChatPageState extends State<ChatPage> {
  String nikeName;
  String imgUrl;
  String lastMsg;
  ChatPageState(this.imgUrl, this.nikeName,this.lastMsg);

  String inputValue = 'ces';

  TextEditingController textEditingController = new TextEditingController();
  List<ChatItem> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(ChatItem(lastMsg, 1));
  }

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
//                      if(i == 0){
//                        return new Container(
//                          child: Column(
//                            children: <Widget>[
//                              new Row(
//                                children: <Widget>[
//                                  new Image.asset(imgUrl, width: 36.0, height: 36.0),
//                                  new Expanded(
//                                      child: Container(
//                                        height: 50,
//                                        child: Text(
//                                          lastMsg,
//                                          textAlign: TextAlign.left,
//                                          style: TextStyle(color: Colors.red, fontSize: 16),
//                                        ),
//                                        decoration: BoxDecoration(
//                                          borderRadius:BorderRadius.all(Radius.circular(8.0)),
//                                          border: Border.all(
//                                              color: Colors.grey,
//                                              style: BorderStyle.solid
//                                          ),
//                                        ),
//                                      )
//                                  )
//                                ],
//                              ),
//                              Divider(
//                                height: 12,
//                                color: Colors.white,
//                              )
//                            ],
//                          ),
//                        );
//                      }
//                      else{
                        return ChatListView(items[i], imgUrl);
//                      }
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
    ChatItem chatItem = new ChatItem(inputValue, 0);
    ChatItem chatItem2 = new ChatItem(getoutValue(inputValue), 1);
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



  ChatItem(this.msg, this.type);

  String getMsg() {
    return msg;
  }
}

class ChatListView extends StatefulWidget {
  ChatItem item;
  String imgUrl;


  ChatListView(this.item, this.imgUrl);

  @override
  State<StatefulWidget> createState() => _ChatListViewState(item, imgUrl);
}

class _ChatListViewState extends State<ChatListView> {
  ChatItem item;
  String imgUrl;

  var defaultAvatar = 'images/me.png';

  _ChatListViewState(this.item, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getItem();
  }

  Widget getItem() {
    if (item.type == 0) {
      return new Container(
          child: Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: Container(
                      height: 50,
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
              Divider(
                height: 12,
                color: Colors.white,
              )
            ],
          ),
      );
    } else {
      return new Container(
        child: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Image.asset(imgUrl, width: 36.0, height: 36.0),
                new Expanded(
                    child: Container(
                      height: 50,
                      child: Text(
                        item.msg,
                        textAlign: TextAlign.left,
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
                    )
                )
              ],
            ),
            Divider(
              height: 12,
              color: Colors.white,
            )
          ],
        ),
      );
    }
  }
}