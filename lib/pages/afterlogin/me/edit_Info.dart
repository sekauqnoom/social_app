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
  String _userId = "糖醋丸子";
  String _name = "林燕玲";
  String _gender = "女";
  DateTime _birthday = DateTime(2000,7,13);
  DateTime _birthdayChoosed;

  String _sno ="2018091605026";
  int _enrollYear = 2018;
  int _enrollYearChoosed;
  String _department = "信软";
  String _departmentChoosed;
  String _major = "软件工程";
//  hobby _hobby = hobby.movie;
  List<String> _hobby = [];
  List<String> _hobbyChoosed = [];
  GlobalKey _formKey = GlobalKey<FormState>();

//  if(_hooby=hobby.movie){
//
//  }
  set birthday(DateTime value) {
    _birthday = value;
  }

  set birthdayChoosed(DateTime value) {
    _birthdayChoosed = value;
  } //TextEditingController for all information

  TextEditingController _userIdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _snoController = TextEditingController();
  TextEditingController _majorController = TextEditingController();
  bool _userIdCorrect = false;
  bool _nameCorrect = false;
  bool _snoCorrect = false;
  bool _majorCorrect = false;
  String _userIdErrMsg;
  String _nameErrMsg;
  String _snoErrMsg;
  String _majorErrMsg;

  FixedExtentScrollController enrollYearScrollController = FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    _userIdController.text = _userId;
    _nameController.text = _name;
    _snoController.text = _sno;
    _majorController.text = _major;
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

    _majorController.addListener((){
      if (_majorController.text.isEmpty) {
        setState(() {
          _majorCorrect = false;
          _majorErrMsg = "所在专业不能为空";
        });
      } else if (_snoController.text.length > 10) {
        setState(() {
          _majorCorrect = false;
          _majorErrMsg = "专业名称过长";
        });
      } else {
        setState(() {
          _majorCorrect = true;
          _majorErrMsg = null;
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
    _hobbyChoosed = _hobby;
    var hobbysCheck = new Map.fromIterable(Hobbys, key: (item) => item, value: (item) => _hobby.contains(item));

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
                          _renderTitleActionsView('选择出生日期'),               //确定，取消
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date, //日期时间模式，此处为日期模式
                                onDateTimeChanged: (dateTime) { //日期改变时调用的方法
                                  if (dateTime == null) {
                                    return;
                                  }
                                  print('当前选择了：${dateTime.year}年${dateTime.month}月${dateTime.day}日');
                                  setState(() {
                                    this._birthdayChoosed = dateTime;
                                  });
                                },
                                initialDateTime: DateTime.now(), //初始化展示时的日期时间
                                minimumYear: 1970, //最小年份，只有mode为date时有效
                                maximumYear: DateTime.now().year, //最大年份，只有mode为date时有效
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
          new ListTile(
            leading: Icon(Icons.calendar_today),
            title: new Text('入学年份: '+ _enrollYear.toString(), style: TextStyle(color: Colors.grey)),
            trailing: GestureDetector(
              child: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        children: <Widget>[
                          _renderTitleActionsView('选择入学年份'),               //确定，取消
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: CupertinoPicker(
                                  scrollController: enrollYearScrollController,
                                  magnification:1.0, // 整体放大率
                                  //offAxisFraction:10.0,// 球面效果的透视系数,消失点位置
                                  itemExtent: 40,  // 所有子节点 统一高度
//                                  useMagnifier:true,// 是否使用放大效果
                                  onSelectedItemChanged: (position) {
                                    print('The position is $position');
                                    setState(() {
                                      this._enrollYearChoosed = DateTime.now().year - 11 + position;
                                    });
                                  },
                                children: List<Widget>.generate(12, (int index) {    //只能选择近12年的年份
                                  return Center(child:
                                  Text((DateTime.now().year - 11 + index).toString()+'年'),
                                  );
                                }),),
                            ),
                          ),
                        ],
                      );
                    }
                );
              },
            ),
          ),
          new ListTile(
            leading: Icon(Icons.school),
            title: new Text('所在院系: '+ _department, style: TextStyle(color: Colors.grey)),
            trailing: GestureDetector(
              child: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        children: <Widget>[
                          _renderTitleActionsView('选择所在院系'),               //确定，取消
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: CupertinoPicker(
                                scrollController: enrollYearScrollController,
//                                magnification:1.0, // 整体放大率
                                //offAxisFraction:10.0,// 球面效果的透视系数,消失点位置
                                itemExtent: 40,  // 所有子节点 统一高度
//                                useMagnifier:true,// 是否使用放大效果
                                onSelectedItemChanged: (position) {
                                  setState(() {
                                    this._departmentChoosed = Departments[position];
                                  });
                                },
                                children: List<Widget>.generate(Departments.length, (int index) {
                                  return Center(child:
                                  Text(Departments[index]),
                                  );
                                }),),
                            ),
                          ),
                        ],
                      );
                    }
                );
              },
            ),
          ),
          new ListTile(
            title: new TextField(
              controller: _majorController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                icon: Icon(Icons.school),
                labelText: '所在专业',
                errorText: _snoErrMsg,
              ),
              //limit MAX input=20
              autofocus: false,
            ),
          ),

          //个性资料
          new ListTile(
            title: new Text('个性资料'),
          ),
          new ListTile(
            leading: Icon(Icons.calendar_today),
            title: new Text('兴趣爱好: ', style: TextStyle(color: Colors.grey)),
            trailing: GestureDetector(
              child: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        children: <Widget>[
                          _renderTitleActionsView('选择兴趣爱好'),               //确定，取消
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(8.0),
                              height: 210.0,
//                              decoration: BoxDecoration(color: Colors.white),
                              child: ListView(
                                children: List<Widget>.generate(hobbysCheck.length, (int index) {
                                  return ListTile(
                                    leading: Checkbox(
                                      value: hobbysCheck[Hobbys[index]],
                                      onChanged: (value) {
                                        setState(() {
                                          hobbysCheck[Hobbys[index]] = value;
                                          if(hobbysCheck[Hobbys[index]] && !_hobbyChoosed.contains(Hobbys[index])){
                                            _hobbyChoosed.add(Hobbys[index]);
                                            print('当前选择是'+Hobbys[index]+ hobbysCheck[index].toString());
                                          }
                                        });
                                      },
                                      activeColor: Colors.red,
                                      checkColor: Colors.blue,
                                      tristate:true,
                                    ),
                                    title: Text(Hobbys[index]),
                                  );
                                }),
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
  Widget _renderTitleActionsView(String title) {
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
            child: Text(title,textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0),),
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
                if(title=='选择出生日期'){
                  setState((){
                    this.birthday = _birthdayChoosed;
                  });
                }
                else if(title=='选择入学年份'){
                  setState(() {
                    this._enrollYear = _enrollYearChoosed;
                  });
                }
                else if(title=='选择所在院系'){
                  setState(() {
                    this._department = _departmentChoosed;
                  });
                }
                else if(title=='选择兴趣爱好'){
                  setState(() {
                    this._hobby = _hobbyChoosed;
                    print('当前选择是'+ _hobby.toString());
                  });
                }
                Navigator.pop(context);
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

const List<String> Departments = <String>[
  '信息与通信工程学院', '电子科学与工程学院', '材料与能源学院', '机械与电气工程学院', '光电科学与工程学院', '自动化工程学院',
  '资源与环境学院', '计算机科学与工程学院', '信息与软件工程学院', '航空航天学院', '数学科学学院', '物理学院',
  '医学院', '生命科学与技术学院', '经济与管理学院', '外国语学院', '马克思主义学院', '格拉斯哥学院',
  '体育部', '基础与前沿科学院', '通信抗干扰技术国家级重点实验室', '英才实验学院', '其他学院',
];

const List<String> Hobbys = [
  '电影', '追剧','游戏', '街机', '二次元',
  '摄影', '数码', '睡觉', '宅家里', '绘画', '手工',
  '书法', '写作', '魔术', '舞蹈', '表演', '曲艺',
  '唱K', '听歌', '吉他', '钢琴', '小提琴', '键盘', '架子鼓',
  '跑步', '健身', '排球','足球','篮球','羽毛球','网球','台球','溜冰', '滑板', '爬山',
  '购物', '逛街', '旅游', '美妆', '美食', '烹饪', '烘焙', '雕刻', '设计'
];

//Map<String,bool> hobbysCheck = <String,bool>{
//  '电影':false, '追剧':false,'游戏':false, '街机':false, '二次元':false,
//  '摄影':false, '数码':false, '睡觉':false, '宅家里':false, '绘画':false, '手工':false,
//  '书法':false, '写作':false, '魔术':false, '舞蹈':false, '表演':false, '曲艺':false,
//  '唱K':false, '听歌':false, '吉他':false, '钢琴':false, '小提琴':false, '键盘':false, '架子鼓':false,
//  '跑步':false, '健身':false, '排球':false,'足球':false,'篮球':false,'羽毛球':false,'网球':false,'台球':false,'溜冰':false, '滑板':false, '爬山':false,
//  '购物':false, '逛街':false, '旅游':false, '美妆':false, '美食':false, '烹饪':false, '烘焙':false, '雕刻':false, '设计':false
//};



