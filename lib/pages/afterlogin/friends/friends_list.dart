import 'package:flutter/material.dart';
import 'ContactInfo.dart';
import 'suspension_listview.dart';

class FriendsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FriendsPageState();
}

class FriendsPageState extends State<FriendsPage> {
  List<ContactInfo> contactList = List();
  String _checkTag = "A";
  var defaultAvatar = 'images/me.png';

//  var newFriend = 'images/ww_main_contact_new_friend.png';
//  var group = 'images/ww_main_contact_group.png';
//  var tag = 'images/ww_main_contact_tag.png';
//  var publicNumber = 'images/ww_main_contact_public_number.png';

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("通讯录", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
      ),
      body: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: TabBar(
                tabs: <Widget>[
                  Tab(text: '好友列表'),Tab(text: '推荐好友'),
                ],
                unselectedLabelColor: Colors.black54,
                labelColor: Colors.blue,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
              ),
              body: TabBarView(
                children: <Widget>[
                  //tab1页面
                  Column(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: QuickSelectListView(
                            data: contactList,
                            itemBuilder: (context, model) => _buildListItem(model),
                            suspensionWidget: _buildSusWidget(_checkTag),
                            isUseRealIndex: true,
                            itemHeight: 60,
                            suspensionHeight: 20,
                            header: QuickSelectListViewHeader(
                              tag: "★",
                              height: 0,
                              builder: (context) {
                                return Container();
//                                return Container(
//                                  child: Column(
//                                    children: <Widget>[
//                                      GestureDetector(
//                                        child: Container(
//                                          margin: new EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
//                                          height: 50.0,
//                                          child: new Row(
//                                            children: <Widget>[
//                                              Icon(Icons.person_add),
//                                              Padding(
//                                                padding: new EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
//                                                child: new Text('新的朋友'),
//                                              )
//                                            ],
//                                          ),
//                                        ),
//                                        onTap: (){
//
//                                        },
//                                      ),
//                                      Divider(
//                                        height: 5.0,
//                                      ),
//                                    ],
//                                  ),
//                                );
                              },
                            ),
                            onSusTagChanged: _onSusTagChanged,
                            //showCenterTip: false,
                          )),
                    ],
                  ),

                  //tab2页面
                  Container(

                  ),
                ],
              )
          )
      ),
//      body:Column(
//        children: <Widget>[
//          Expanded(
//              flex: 1,
//              child: QuickSelectListView(
//                data: contactList,
//                itemBuilder: (context, model) => _buildListItem(model),
//                suspensionWidget: _buildSusWidget(_checkTag),
//                isUseRealIndex: true,
//                itemHeight: 60,
//                suspensionHeight: 20,
//                header: QuickSelectListViewHeader(
//                    tag: "★",
//                    height: 55,
//                    builder: (context) {
//                      return Container(
//                        child: Column(
//                          children: <Widget>[
//                            GestureDetector(
//                              child: Container(
//                                margin: new EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
//                                height: 50.0,
//                                child: new Row(
//                                  children: <Widget>[
//                                    Icon(Icons.person_add),
//                                    Padding(
//                                      padding: new EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
//                                      child: new Text('新的朋友'),
//                                    )
//                                  ],
//                                ),
//                              ),
//                              onTap: (){
//
//                              },
//                            ),
//                            Divider(
//                              height: 5.0,
//                            ),
//                          ],
//                        ),
//                      );
//                    },
//                ),
//                onSusTagChanged: _onSusTagChanged,
//                //showCenterTip: false,
//              )),
//        ],
//      ),
    );
  }

  ///
  /// 初始化数据
  ///
  void initData() {
    for (int i = 0; i < 60; i++) {
      if (i < 5) {
        contactList
            .add(ContactInfo(name: 'Ai卓玛' + i.toString(), namePinyin: 'A'));
      } else if (i < 10) {
        contactList
            .add(ContactInfo(name: 'Bi卓玛' + i.toString(), namePinyin: 'B'));
      } else if (i < 15) {
        contactList
            .add(ContactInfo(name: 'Ci卓玛' + i.toString(), namePinyin: 'C'));
      } else if (i < 20) {
        contactList
            .add(ContactInfo(name: 'Di卓玛' + i.toString(), namePinyin: 'D'));
      } else if (i < 25) {
        contactList
            .add(ContactInfo(name: 'Ei卓玛' + i.toString(), namePinyin: 'E'));
      } else if (i < 30) {
        contactList
            .add(ContactInfo(name: 'Fi卓玛' + i.toString(), namePinyin: 'F'));
      } else if (i < 35) {
        contactList
            .add(ContactInfo(name: 'Gi卓玛' + i.toString(), namePinyin: 'G'));
      } else if (i < 40) {
        contactList
            .add(ContactInfo(name: 'Hi卓玛' + i.toString(), namePinyin: 'H'));
      } else if (i < 45) {
        contactList
            .add(ContactInfo(name: 'Ii卓玛' + i.toString(), namePinyin: 'I'));
      } else if (i < 50) {
        contactList
            .add(ContactInfo(name: 'Ji卓玛' + i.toString(), namePinyin: 'J'));
      } else if (i < 55) {
        contactList
            .add(ContactInfo(name: 'Ki卓玛' + i.toString(), namePinyin: 'K'));
      } else if (i < 60) {
        contactList
            .add(ContactInfo(name: 'Li卓玛' + i.toString(), namePinyin: 'L'));
      }
    }
  }

  ///
  /// 创建每一个条目
  ///
  _buildListItem(ContactInfo model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        SizedBox(
          height: 60.0,
          child: ListTile(
            title: new Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: 50.0,
                    child: new Row(
                      children: <Widget>[
                        new Image.asset(defaultAvatar, width: 35.0, height: 35.0),
                        Padding(
                          padding: new EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                          child: new Text(model.name),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    margin: new EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                    height: 0.5,
                    color: const Color(0xffebebeb),
                  ),
                ],
              ),
            ),
            onTap: () {
              print("OnItemClick: $model");
              Navigator.pop(context, model);
            },
          ),
        )
      ],
    );
  }

  ///
  /// 标签回调监听
  ///
  _onSusTagChanged(String tag) {
    setState(() {
      _checkTag = tag;
    });
  }

  ///
  /// 这是tag控件
  ///
  _buildSusWidget(String susTag) {
    return Container(
      height: 20.0,
      padding: const EdgeInsets.only(left: 15.0),
      color: Color(0xfff3f4f5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$susTag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xff999999),
        ),
      ),
    );
  }
}