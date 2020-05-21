import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/model/hobby/hobby_model.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class EditInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditInfoPageState();
}

class EditInfoPageState extends State<EditInfoPage> with TickerProviderStateMixin{
  String _userId = "啦啦啦";
  String _name = "哈哈哈";
  String _gender = "女";
  DateTime _birthday = DateTime(2000,7,13);
  int _y = DateTime.now().year;    //记录选中的生日年份
  int _m = DateTime.now().month;    //记录选中的生日月份
  int _d = DateTime.now().day;    //记录选中的生日日期
  set birthday(DateTime value) {
    _birthday = value;
  }
  final _year = new List<int>();
  final _month = new List<int>();
  final _day = new List<int>();

  String _sno ="290831";
  int _enrollYear = 2018;
  String _department = "信软";
  String _major = "软件工程";
  hobby _hobby = hobby.movie;
  GlobalKey _formKey = GlobalKey<FormState>();


  //TextEditingController for all information
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _snoController = TextEditingController();
  bool _userIdCorrect = false;
  bool _nameCorrect = false;
  bool _snoCorrect = false;
  String _userIdErrMsg;
  String _nameErrMsg;
  String _snoErrMsg;

  TextEditingController _genderController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();
  TextEditingController _enrollYearController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _majorController = TextEditingController();
  TextEditingController _hobbyController = TextEditingController();

  FixedExtentScrollController leftScrollCtrl, middleScrollCtrl, rightScrollCtrl;
//  bool yearChoosed = true;
//  bool monthChoosed = true;
  bool dayChoosed = false;

  void refreshScrollOffset() {
//    print('refreshScrollOffset ${widget.pickerModel.currentRightIndex()}');
    leftScrollCtrl =
    new FixedExtentScrollController(initialItem: 3);
    middleScrollCtrl =
    new FixedExtentScrollController(initialItem: 3);
    rightScrollCtrl =
    new FixedExtentScrollController(initialItem: 3);
  }

  @override
  void initState() {
    super.initState();
    _userIdController.text = _userId;
    _nameController.text = _name;
    _snoController.text = _sno;
    refreshScrollOffset();

//    _userIdController.addListener((){
//      if (_userIdController.text.contains(RegExp(r"^[a-zA-Z0-9_\u4e00-\u9fa5]+$"))) {
//        setState(() {
//          _userIdCorrect = false;
//          _userIdErrMsg = "昵称只能含有汉字、数字、字母、下划线";
//        });
//      } else if (_userIdController.text.isEmpty) {
//        setState(() {
//          _userIdCorrect = false;
//          _userIdErrMsg = "昵称不能为空";
//        });
//      } else if (_userIdController.text.length >= 12) {
//        setState(() {
//          _userIdCorrect = false;
//          _userIdErrMsg = "昵称过长";
//        });
//      } else {
//        setState(() {
//          _userIdCorrect = true;
//          _userIdErrMsg = null;
//        });
//      }
//    });

//    _nameController.addListener((){
//      if (_userIdController.text.contains(RegExp(r"^[a-zA-Z0-9_\u4e00-\u9fa5]+$"))) {
//        setState(() {
//          _userIdCorrect = false;
//          _userIdErrMsg = "昵称只能含有汉字、数字、字母、下划线";
//        });
//      } else if (_userIdController.text.isEmpty) {
//        setState(() {
//          _userIdCorrect = false;
//          _userIdErrMsg = "昵称不能为空";
//        });
//      } else if (_userIdController.text.length >= 12) {
//        setState(() {
//          _userIdCorrect = false;
//          _userIdErrMsg = "昵称过长";
//        });
//      } else {
//        setState(() {
//          _userIdCorrect = true;
//          _userIdErrMsg = null;
//        });
//      }
//    });

    _snoController.addListener((){
      if (_snoController.text.isEmpty) {
        setState(() {
          _snoCorrect = false;
          _snoErrMsg = "学号不能为空";
        });
      } else if (_snoController.text.length != 13) {
        setState(() {
          _snoCorrect = false;
          _snoErrMsg = "学号长度不正确";
        });
      } else {
        setState(() {
          _snoCorrect = true;
          _snoErrMsg = null;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    for(int i=0; i < (DateTime.now().year - 1970 +1); i++){
      _year.add(i+1970);
    }
    for(int i=0; i < 12; i++){
      _month.add(i+1);
    }
    for(int i=0; i < (calcDateCount(_y,_m)); i++){
      _day.add(i+1);
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        title: Text("我的资料", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
      ),
      body:new ListView(
        children: <Widget>[
          //基本资料
          new ListTile(
              title: new Text('基本资料'),
          ),
          new Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                new ListTile(
                  title: new TextFormField(
                    controller: _userIdController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      icon: Icon(Icons.account_circle),
                      labelText: '编辑昵称',
                    ),
                    //limit MAX input=20
                    inputFormatters:[WhitelistingTextInputFormatter(RegExp(r"^[a-zA-Z0-9_\u4e00-\u9fa5]+$")),LengthLimitingTextInputFormatter(20)] ,
                    validator: (value) {// 校验用户名
                      return value.trim().length > 0 ? null : '昵称不能为空';
                    },
                    autofocus: false,
                  ),
                ),
                new ListTile(
                  title: new TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      icon: Icon(Icons.person),
                      labelText: '姓名',
                    ),
                    //limit MAX input=20
                    inputFormatters:[WhitelistingTextInputFormatter(RegExp(r"^[\u4E00-\u9FA5][\u4E00-\u9FA5\.．]*[\u4E00-\u9FA5]$")),LengthLimitingTextInputFormatter(20)] ,
                    validator: (value) {// 校验用户名
                      return value.trim().length > 0 ? null : '姓名不能为空';
                    },
                    autofocus: false,
                  ),
                ),
              ],
            ),
          ),
          new ListTile(
            leading: Icon(Icons.people),
            title: new Text('性别: '+_gender, style: TextStyle(color: Colors.grey)),
            trailing: GestureDetector(
              child: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                showDialog(context: context, builder: (_) => chooseGenderDialog());
              },
            ),
          ),
          new ListTile(
            leading: Icon(Icons.calendar_today),
            title: new Text(
                '出生日期: '+_birthday.year.toString()+'/'+_birthday.month.toString()+'/'+_birthday.day.toString(),
                style: TextStyle(color: Colors.grey)),
            trailing: GestureDetector(
              child: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        children: <Widget>[
                          _renderTitleActionsView(),               //确定，取消
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        height: 210.0,
                                        decoration: BoxDecoration(color: Colors.white),
                                        child: ListView.builder(
//                                        controller: leftScrollCtrl,
                                          itemCount: _year.length *2 - 1,
                                          itemBuilder: (context, position) {
                                            if(position.isEven){
                                              int index = position~/2;
                                              return GestureDetector(
                                                child: Container(
                                                  height: 36.0,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    _year[index].toString()+"年",
                                                    style: TextStyle(color: this._y == _year[index]?  Colors.blue:Color(0xFF000046), fontSize: 18),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                onTap: (){
                                                  setState((){
                                                    this._y = _year[index];
//                                                    this.yearChoosed = true;
                                                  });
                                                },
                                              );
                                            }
                                            else{
                                              return Divider(height: 5,);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "",
                                    style: TextStyle(color: Color(0xFF000046), fontSize: 18),
                                  ),
                                  Container(
                                    child: Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        height: 210.0,
                                        decoration: BoxDecoration(color: Colors.white),
                                        child:  ListView.builder(
//                                        controller: middleScrollCtrl,
                                          itemCount: _month.length *2 -1,
                                          itemBuilder: (context, position) {
                                            int index = position~/2;
                                            if(position.isEven){
                                              return GestureDetector(
                                                child: Container(
                                                  height: 36.0,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    _month[index].toString()+"月",
                                                    style: TextStyle(color: this._m == _month[index]? Colors.blue :Color(0xFF000046), fontSize: 18),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                onTap: (){
                                                  setState((){
                                                    this._m = _month[index];
//                                                    this.monthChoosed = true;

                                                  });
                                                },
                                              );
                                            }
                                            else{
                                              return Divider(height: 5,);
                                            }
                                          },
                                        ),// : null,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "",
                                    style: TextStyle(color: Color(0xFF000046), fontSize: 18),
                                  ),
                                  Container(
                                    child: Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        height: 210.0,
                                        decoration: BoxDecoration(color: Colors.white),
                                        child:  ListView.builder(
//                                        controller: leftScrollCtrl,
                                          itemCount: _day.length*2 -1,
                                          itemBuilder: (context, position) {
                                            if(position.isEven){
                                              int index = position~/2;
                                              return GestureDetector(
                                                behavior: HitTestBehavior.deferToChild,
                                                child: Container(
                                                  height: 36.0,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    _day[index].toString()+"日",
                                                    style: TextStyle(color: this._d == _day[index]? Colors.blue :Color(0xFF000046), fontSize: 18),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                onTap: (){
                                                  setState((){
                                                    this._d = _day[index];
                                                    this.dayChoosed = true;
                                                    print('now choose'+ this._d.toString() +_day[index].toString());
                                                  });
                                                },
                                              );
                                            }
                                            else{
                                              return Divider(height: 5,);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                );
              },
            ),
          ),

          //学籍资料
          new ListTile(
            title: new Text('学籍资料'),
          ),
          new ListTile(
            title: new TextField(
              controller: _snoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                icon: Icon(Icons.perm_identity),
                labelText: '学号',
                errorText: _snoErrMsg,
              ),
              //limit MAX input=20
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//只允许输入数字
              autofocus: false,
            ),
          ),

          //个性资料
          new ListTile(
            title: new Text('个性资料'),
          ),
        ],
      ),
    );
  }

  //选择性别的对话框
  AlertDialog chooseGenderDialog(){
    return AlertDialog(
      title:Text("选择性别",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700)),
      content: SizedBox(
        height: 60.0,
        child: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("男"),
                onTap: (){
                  setState((){
                    this._gender = "男";
                    Navigator.pop(context);
                  });
                },
              ),
              Divider(),
              GestureDetector(
                child: Text("女"),
                onTap: (){
                  setState((){
                    this._gender = "女";
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //bottomSheet的头部
  Widget _renderTitleActionsView() {
    return Container(
      height: 44.0,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 119, 136, 213),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 44.0,
            child: CupertinoButton(
              pressedOpacity: 0.3,
              padding: EdgeInsets.only(left: 16, top: 0),
              child: Text(
                '取消',
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: Text('选择出生日期',textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0),),
          ),
          Container(
            height: 44.0,
            child: CupertinoButton(
              pressedOpacity: 0.3,
              padding: EdgeInsets.only(right: 16, top: 0),
              child: Text(
                '确定',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              onPressed: () {
                if( dayChoosed){
                  setState((){
                    this.birthday = DateTime(_y,_m,_d);
                  });
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  //判断当月天数
  List<int> _leapYearMonths = const <int>[1, 3, 5, 7, 8, 10, 12];

  int calcDateCount(int year, int month) {
    if (_leapYearMonths.contains(month)) {
      return 31;
    } else if (month == 2) {
      if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        return 29;
      }
      return 28;
    }
    return 30;
  }
}


