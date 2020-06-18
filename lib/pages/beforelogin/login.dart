import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:socialapp/model/user/user_model.dart';
import 'package:socialapp/model/user/user_count.dart';
//
//final googleSignIn = new GoogleSignIn();


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  var _passwordController = TextEditingController();
  var _accountController = TextEditingController();

  bool _accountCorrect = false;
  bool _passwordCorrect = false;
  String _accountErrMsg;
  String _passwordErrMsg;

  bool isSent = false;
  bool _remember = false;
  bool isTel;
  bool isMail;
  User user = new User();
  final _auth = FirebaseAuth.instance;

//  Dio dio = initDio();
//  Response res1;
//  Response res2;

  @override
  void dispose() {
    _passwordController.dispose();
    _accountController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _accountController.addListener(() {
      RegExp exp1 = RegExp(
          r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
      isTel = exp1.hasMatch(_accountController.text);     //校验手机号
      RegExp exp2 = RegExp(
          "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$"
      );
      isMail = exp2.hasMatch(_accountController.text);    //校验邮箱

      if (_accountController.text.isEmpty) {
        setState(() {
          _accountCorrect = false;
          _accountErrMsg = "账号不能为空";
        });
      } else if (isMail || isTel) {
        setState(() {
          _accountCorrect = true;
          _accountErrMsg = null;
        });
      } else {
        setState(() {
          _accountCorrect = false;
          _accountErrMsg = "只能输入邮箱或手机号";
        });
      }
    });

    _passwordController.addListener(() {
      if (_passwordController.text.contains(RegExp(r"\W"))) {
        setState(() {
          _passwordCorrect = false;
          _passwordErrMsg = "只能输入0-9, a-z 和 A-Z";
        });
      } else if (_passwordController.text.isEmpty) {
        setState(() {
          _passwordCorrect = false;
          _passwordErrMsg = "密码不能为空";
        });
      } else if (_passwordController.text.length <= 6) {
        setState(() {
          _passwordCorrect = false;
          _passwordErrMsg = "密码太短";
        });
      } else {
        setState(() {
          _passwordCorrect = true;
          _passwordErrMsg = null;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    String _loginMsg = '登录';

    var _accountTextField = TextField(
      decoration: InputDecoration(
        labelText: "请输入账号(e-mail/tel)",
        errorText: _accountErrMsg,
      ),
      controller: _accountController,
      maxLength: 24,
    );

    var _passwordTextField = TextField(
      obscureText: true,
      decoration: InputDecoration(
        errorText: _passwordErrMsg,
        labelText: "请输入密码",
      ),
      controller: _passwordController,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
        centerTitle: true,
      ),
      body: ListView(
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: <Widget>[
                  _accountTextField,
                  _passwordTextField,
                  Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Checkbox(
                      value: _remember,
                      activeColor: Colors.red, //选中时的颜色
                      onChanged:(value){
                        setState(() {
                          _remember=value;
                        });
                      } ,
                    ),
                    Text("记住密码                                "),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/forgetPage");
                      },
                      child: Text("忘记密码?",
                          style: TextStyle(
                            color: Colors.blue,
                          )
                      ),
                    ),
                  ],
                ),
                  FlatButton(
                    disabledColor: Colors.blue,
                    color: Colors.blue,
                    child: Text(_loginMsg, style: TextStyle(color: Colors.white)),
                    onPressed: _accountCorrect && _passwordCorrect ? () async {
                      _loginMsg = "正在登录...";
//                          dio.interceptors.add(CookieManager(await Api.cookieJar));

                      List userList = Provider.of<UserCounter>(context).userList;
                      int i=0;
                      for(;i < userList.length; i++){
                        if(_accountController.text == userList[i].mail
                            || _accountController.text == userList[i].tel){   //之前保存了这个账号的信息了
                          user = userList[i];
                          setState(() {
                            isSent = true;
                          });
                          _loginMsg = "登录成功，正在跳转...";
                          Navigator.of(context).pushNamed("/bottomMenu",arguments: {
                            "user": user,
                          });
//                              res1 = await dioLoginWithCookie(dio);    //直接就用cookie登录了
//                              if(res1.statusCode == 200){
//                                //获取cookies
//                                List<Cookie> cookies = (await Api.cookieJar).loadForRequest(Uri.parse(dio.options.baseUrl+"/v1/api/user/login"));
//                                print(cookies);
//                                print("Load cookies successly");
//
//                                setState(() {
//                                  isSent = true;
//                                });
//                                print(userList.length);
//                                Map<String, dynamic> u = json.decode(res1.data);
//                                user = User.fromJson(u);
//                                dioGetAllCards(dio, user.userId).then((res2)async{
//                                  if(res2.statusCode == 200){
//                                    List<dynamic> js = res2.data;
//                                    //print(js[0]);
//                                    List<CardInfo> list = CardCounter.fromJson(js).cardList;
//                                    //print(list.toString());
//                                    Provider.of<CardCounter>(context).cardList = list;
//                                    print("get cards succeed");
//                                  }
//                                  else{
//                                    showDialog(
//                                        context: context,
//                                        builder: (_) => AlertDialog(
//                                          title: Text("Alert"),
//                                          content: Text("Fail to read"),
//                                        ));
//                                  }
//                                });
//                                print("Login with cookie suceeded");
//                                Navigator.of(context).pushNamed("/bottomMenu",arguments: {
//                                  "user": user,
//                                });
//                              }
//                              else{
//                                _loginMsg = "Login Failed";
//                                showDialog(context: context, builder: (_) => AlertDialog(
//                                  title: Text("Alert"),
//                                  content: Text(_loginMsg),
//                                ));
//                              }
                          break;
                        }
                      }

                      if(i == userList.length){           //之前没有保存这个用户的账号
                        //////判断账号类型
//                            String accountType(){
//                              if(isTel)  return "phone";
//                              else if(isMail)  return "mail";
//                              else  return null;
//                            }
//                            String account = _accountController.text;
//                            String psw = _passwordController.text;
//
//                            res1 = await dioLogin(dio, account, psw, accountType(), _remember);
                        user = User(_accountController.text,_passwordController.text);
                        setState(() {
                          isSent = true;
                        });
//                        if(_remember){    //当前选择记住密码且之前没有保存这个用户的账号
//                          Provider.of<UserCounter>(context).addUser(user);
//                          print("userInfo saved");
//                        }
                        print(userList.length);
//                        final user = await _auth.signInWithEmailAndPassword(
//                            email: _accountController.text, password: _passwordController.text);
                        if(user!=null){
                          Navigator.of(context).pushNamed("/bottomMenu",arguments: {
                            "user": user,
                          });
                          _loginMsg = "登录成功，正在跳转...";
                        }
//
//                            ///登录成功
//                            if (res1.statusCode == 200) {
//                              try {
//                                List<Cookie> cookies = (await Api.cookieJar).loadForRequest(Uri.parse(dio.options.baseUrl+"/v1/api/user/login"));
//                                print(cookies);
//                                print("Load cookies successly");
//
//                                setState(() {
//                                  isSent = false;
//                                });
//                                Map<String, dynamic> u = json.decode(res1.data);
//                                user = User.fromJson(u);
//
//                                if(_remember){    //当前选择记住密码且之前没有保存这个用户的账号
//                                  Provider.of<UserCounter>(context).addUser(user);
//                                  print("userInfo saved");
//                                }
//                                print(userList.length);
//
//                                dioGetAllCards(dio, user.userId).then((res2)async{
//                                  if(res2.statusCode == 200){
//                                    List<dynamic> js = res2.data;
//                                    //print(js[0]);
//                                    List<CardInfo> list = CardCounter.fromJson(js).cardList;
//                                    //print(list.toString());
//                                    Provider.of<CardCounter>(context).cardList = list;
//                                    print("get cards succeed");
//                                  }
//                                  else{
//                                    showDialog(
//                                        context: context,
//                                        builder: (_) => AlertDialog(
//                                          title: Text("Alert"),
//                                          content: Text("Fail to read"),
//                                        ));
//                                  }
//                                });
//                                Navigator.of(context).pushNamed("/bottomMenu",arguments: {
//                                  "user": user,
//                                });
//                                _loginMsg = "Login Suceeded";
//                                print(_loginMsg);
//                              } on FormatException {
//                                _loginMsg = "Login Failed";
//                                showDialog(
//                                    context: context,
//                                    builder: (_) => AlertDialog(
//                                      title: Text("Alert"),
//                                      content: Text(_loginMsg),
//                                    ));
//                              }
//                            }
//
//                            //登录失败
//                            else if (res1.statusCode == 400) {
//                              _loginMsg =
//                              "Network connection failed, "
//                                  "check your network";
//                              print(res1.statusCode);
//                              showDialog(context: context, builder: (_) => AlertDialog(
//                                title: Text("Alert"),
//                                content: Text(_loginMsg),
//                              ));
//                            }
//                            else if (res1.statusCode == 406) {
//                              _loginMsg = "Account does not exist or Password error";
//                              print(res1.statusCode);
//                              showDialog(context: context, builder: (_) => AlertDialog(
//                                title: Text("Alert"),
//                                content: Text(_loginMsg),
//                              ));
//                            }
//                            else{
//                              _loginMsg = "Server error";
//                              print(res1.statusCode);
//                              showDialog(context: context, builder: (_) => AlertDialog(
//                                title: Text("Alert"),
//                                content: Text(_loginMsg),
//                              ));
//                            }
                      }
                    }
                        : null,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/registerPage");
                    },
                    child: Text("注册账号"),
                  ),

                  Container(
                    child: isSent
                        ? CircularProgressIndicator()
                        : null,
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
}
