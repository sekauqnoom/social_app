import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
//import 'package:dio/dio.dart';
//import 'dart:convert';
import 'dart:async';

import 'package:socialapp/model/user/user_model.dart';
import 'package:socialapp/model/user/user_count.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  String _telErrMsg;
  String _emailErrMsg;
  String _passwordErrMsg;
  String _passwordRepeatErrMsg;
  String _verifyCodeErrMsg;
  String _verifyCode;
  bool _telCorrect = false;
  bool _emailCorrect = false;
  bool _passwordCorrect = false;
  bool _passwordRepeatCorrect = false;
  bool _verifyCorrect = false;
  bool _verifyNotEmpty = false;
  bool isTel;
  bool isMail;
  var _telController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _passwordRepeatController = TextEditingController();
  var _verifyController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  User user;
  Timer _timer;
  String _registerMsg;
  bool isSent = false;
  int _countdownTime = 0;
//  var dio = initDio();
//  Response resVerify;
//  Response resSignUp;

  @override
  void initState() {
    super.initState();
    _telController.addListener(() {
      RegExp exp1 = RegExp(
          r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
      isTel = exp1.hasMatch(_telController.text);     //校验手机号

      if (!isTel) {
        setState(() {
          _telCorrect = false;
          _telErrMsg = "手机号格式不正确";
        });
      } else if (_telController.text.isEmpty) {
        setState(() {
          _telCorrect = false;
          _telErrMsg = "手机号不能为空";
        });
      } else {
        setState(() {
          _telCorrect = true;
          _telErrMsg = null;
        });
      }
    });

    _emailController.addListener(() {
      RegExp exp2 = RegExp(
          "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$"
      );
      isMail = exp2.hasMatch(_emailController.text);    //校验邮箱

      if (_emailController.text.isEmpty) {
        setState(() {
          _emailCorrect = false;
          _emailErrMsg = "邮箱不能为空";
        });
      } else if (!isMail) {
        _emailCorrect = false;
        _emailErrMsg = "邮箱格式不正确";
      } else {
        setState(() {
          _emailCorrect = true;
          _emailErrMsg = null;
        });
      }
    }
    );

    _passwordController.addListener(() {
      if (_passwordController.text.contains(RegExp(r"\W"))) {
        setState(() {
          _passwordCorrect = false;
          _passwordErrMsg = "密码只能包括字母和数字";
        });
      } else if (_passwordController.text.isEmpty) {
        setState(() {
          _passwordCorrect = false;
          _passwordErrMsg = "密码不能为空";
        });
      } else if (_passwordController.text.length <= 6) {
        setState(() {
          _passwordCorrect = false;
          _passwordErrMsg = "密码过短";
        });
      } else {
        setState(() {
          _passwordCorrect = true;
          _passwordErrMsg = null;
        });
      }
    });

    _passwordRepeatController.addListener(() {
      if (_passwordRepeatController.text != _passwordController.text) {
        setState(() {
          _passwordRepeatCorrect = false;
          _passwordRepeatErrMsg = "密码不一致";
        });
      } else {
        setState(() {
          _passwordRepeatCorrect = true;
          _passwordRepeatErrMsg = null;
        });
      }
    });


    _verifyController.addListener(() {
      if (_verifyController.text != _verifyCode) {
        setState(() {
          _verifyCorrect = false;
          _verifyCodeErrMsg = "验证码错误";
        });
      } else if (_passwordController.text.isEmpty) {
        setState(() {
          _verifyCorrect = false;
          _verifyCodeErrMsg = "验证码不能为空";
        });
      } else {
        setState(() {
          _verifyCorrect = true;
          _verifyCodeErrMsg = null;
        });
      }
    });
  }

  void startCountdownTimer() {
    const oneSec = const Duration(seconds: 1);

    var callback = (timer) => {
      setState(() {
        if (_countdownTime < 1) {
          _timer.cancel();
        } else {
          _countdownTime = _countdownTime - 1;
        }
      })
    };

    _timer = Timer.periodic(oneSec, callback);
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    var _telTextFiled = TextField(
      decoration: InputDecoration(
//        hintText: "Telephone number",
        labelText: "Tel",
        errorText: _telErrMsg,
      ),
      controller: _telController,
      maxLength: 24,
    );

    var _emailTextField = TextField(
      decoration: InputDecoration(
        labelText: "邮箱",
        errorText: _emailErrMsg,
      ),
      controller: _emailController,
      maxLength: 30,
    );

    var _passwordTextField = TextField(
      decoration: InputDecoration(
        labelText: "请输入密码",
        errorText: _passwordErrMsg,
      ),
      controller: _passwordController,
      obscureText: true,
      maxLength: 16,
    );

    var _passwordRepeatTextField = TextField(
      decoration: InputDecoration(
        labelText: "重复输入密码",
        errorText: _passwordRepeatErrMsg,
      ),
      controller: _passwordRepeatController,
      obscureText: true,
      maxLength: 16,
    );

    var _verifyCodeTextField = TextField(
      decoration: InputDecoration(
        labelText: "请输入验证码",
      ),
      controller: _verifyController,
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('注册账号'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _telTextFiled,
                  _passwordTextField,
                  _passwordRepeatTextField,
                  _emailTextField,
                  MaterialButton(
                    onPressed: () async {
                      if (_countdownTime == 0 && _emailCorrect) {
//                        resVerify = await dioRegisterVerify(dio, _emailController.text);
//                        print(resVerify.statusCode);
//                        if (resVerify.statusCode == 200){
//                          _verifyCode = jsonDecode(resVerify.data)["data"];
//                        } else if (resVerify.statusCode == 400) {
//                          showDialog(
//                              context: context,
//                              builder: (_) => AlertDialog(
//                                title: Text("Error"),
//                                content: Text("Network connection failed"),
//                              )
//                          );
//                        } else if (resVerify.statusCode == 500){
//                          showDialog(
//                              context: context,
//                              builder: (_) => AlertDialog(
//                                title: Text("Error"),
//                                content: Text("Server Error"),
//                              )
//                          );
//                        } else if (resVerify.statusCode == 404){
//                          showDialog(
//                              context: context,
//                              builder: (_) => AlertDialog(
//                                title: Text("Error"),
//                                content: Text("404"),
//                              )
//                          );
//                        }
                        setState(() {
                          _countdownTime = 60;
                        });
                        startCountdownTimer();
                      }
                    },
                    child: Container(
                      color: Colors.yellow,
                      child: Text(
                        _countdownTime > 0 ? '${_countdownTime}s' : '发送验证码',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  _verifyCodeTextField,
                  MaterialButton(
                    onPressed: _telCorrect && _passwordCorrect && _passwordRepeatCorrect && _emailCorrect
                        ? () async {
                      if (!_verifyCorrect){
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text("注册失败"),
                              content: Text("验证码错误"),
                            ));
                        setState(() {
                          _verifyController.clear();
                        });
                      }
                      _registerMsg = "";
                      setState(() {
                        isSent = true;
                      });
                      User user = User("undefined",_passwordController.text);
                      user.mail = _emailController.text;
                      user.tel = _telController.text;
//                      final newUser = await _auth.createUserWithEmailAndPassword(
//                          email: _emailController.text, password: _passwordController.text);
                      Navigator.of(context).pushNamed("/loginPage",arguments: {
                        "user": user,
                      });
//                      resSignUp = await dioRegister(dio, user, _verifyController.text);
//                      setState(() {
//                        isSent = false;
//                      });
//                      if (resSignUp.statusCode == 200) {
//                        print("${resSignUp.data}");
//                        try {
//                          Map<String, dynamic> json = jsonDecode(resSignUp.data);
//                          if (json["msg"] == "success") {
//                            _registerMsg = "Register Succeeded";
//                            Navigator.of(context).pop();
//                          } else {
//                            _registerMsg = json["msg"];
//                            showDialog(
//                                context: context,
//                                builder: (_) => AlertDialog(
//                                  title: Text("Register Failed!"),
//                                  content: Text(_registerMsg),
//                                ));
//                          }
//                        } on FormatException {
//                          showDialog(
//                              context: context,
//                              builder: (_) => AlertDialog(
//                                title: Text("Register Failed!"),
//                                content: Text(_registerMsg),
//                              ));
//                        }
//                      } else if (resSignUp.statusCode == 400 ||
//                          resSignUp.statusCode == 404) {
//                        _registerMsg =
//                        "Network connection failed, "
//                            "check your network";
//                        showDialog(context: context, builder: (_) => AlertDialog(
//                          title: Text("Alert"),
//                          content: Text(_registerMsg),
//                        ));
//                      } else if (resSignUp.statusCode >= 500) {
//                        _registerMsg = "Server error";
//
                    } : (){
                      print(_telCorrect);
                      print(_passwordCorrect);
                      print(_passwordRepeatCorrect);
                      print(_emailCorrect);
                      print(_verifyCorrect);
                    },
                    color: Colors.blue,
                    child: Container(
                      child: Text(
                        "注册",
                        textAlign: TextAlign.center,
                        //style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
