import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:socialapp/model/comment/comment_model.dart';
import 'package:socialapp/model/comment/comment_count.dart';
import 'package:socialapp/model/course/course_model.dart';
import 'package:socialapp/model/course/course_count.dart';
import 'package:socialapp/model/friends/friend_model.dart';
import 'package:socialapp/model/friends/friend_count.dart';
import 'package:socialapp/model/hobby/hobby_model.dart';
import 'package:socialapp/model/hobby/hobby_count.dart';
import 'package:socialapp/model/contact/contact_model.dart';
import 'package:socialapp/model/contact/contact_count.dart';
import 'package:socialapp/model/shared_dynamics/dynamic_model.dart';
import 'package:socialapp/model/shared_dynamics/dynamic_count.dart';
import 'package:socialapp/model/user/user_model.dart';
import 'package:socialapp/model/user/user_count.dart';
import 'package:socialapp/model/news/spider_news.dart';
import 'package:socialapp/pages/afterlogin/Home/resource_page.dart';

import 'package:socialapp/pages/afterlogin/bottom_menu.dart';
import 'package:socialapp/pages/beforelogin/find_password.dart';
import 'package:socialapp/pages/beforelogin/forget_password.dart';
import 'package:socialapp/pages/beforelogin/register.dart';
import 'package:socialapp/pages/beforelogin/login.dart';
import 'package:socialapp/pages/afterlogin/home/home_page.dart';
import 'package:socialapp/pages/afterlogin/home/news_page.dart';
import 'package:socialapp/pages/afterlogin/course_table.dart';
import 'package:socialapp/pages/afterlogin/dynamics/dynamics_page.dart';
import 'package:socialapp/pages/afterlogin/dynamics/write_something.dart';
import 'package:socialapp/pages/afterlogin/friends/add_friend.dart';
import 'package:socialapp/pages/afterlogin/message/chat_page.dart';
import 'package:socialapp/pages/afterlogin/message/message_list.dart';
import 'package:socialapp/pages/afterlogin/me/drawer.dart';
import 'package:socialapp/pages/afterlogin/me/edit_Info.dart';
import 'package:socialapp/pages/afterlogin/me/settings.dart';

void main() => runApp(SocialApp());

class SocialApp extends StatefulWidget {
  @override
  SocialAppState createState() => new SocialAppState();
}

class SocialAppState extends State<SocialApp> with SingleTickerProviderStateMixin{
  // This widget is the root of your application.
//  TabController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
//    controller = new TabController(length: 4, vsync: this);
//    eventBus.on<EventOpenDrawer>().listen((EventOpenDrawer data) {
//      if (data.flag) _scaffoldKey.currentState.openDrawer();
//    });
  }

  @override
  void dispose() {
//    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => User(),),
        ChangeNotifierProvider(builder: (context) => UserCounter(),),
        ChangeNotifierProvider(builder: (context) => Friend(),),
        ChangeNotifierProvider(builder: (context) => FriendCounter(),),
        ChangeNotifierProvider(builder: (context) => Comment(),),
        ChangeNotifierProvider(builder: (context) => CommentCounter(),),
//        ChangeNotifierProvider(builder: (context) => Course(),),
        ChangeNotifierProvider(builder: (context) => CourseCounter(),),
        ChangeNotifierProvider(builder: (context) => Hobby(),),
        ChangeNotifierProvider(builder: (context) => HobbyCounter(),),
        ChangeNotifierProvider(builder: (context) => Contact(),),
        ChangeNotifierProvider(builder: (context) => ContactCounter(),),
//        ChangeNotifierProvider(builder: (context) => Dynamic(),),
        ChangeNotifierProvider(builder: (context) => DynamicCounter(),),
//        ChangeNotifierProvider(builder: (context) => News(),),
      ],
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor:  Color.fromARGB(255, 119, 136, 213),
        ),
        home: new Scaffold(
          key: _scaffoldKey,
          body: LoginPage(),
        ),
        routes: {
          "/loginPage": (_) => LoginPage(),
          "/registerPage": (_) => RegisterPage(),
          "/forgetPage": (_) => ForgetPasswordPage(),
          "/findpasswordpage":(_)=> FindPasswordPage(),

          "/editInfo" : (_) => EditInfoPage(),
          "/settings":  (_) => SettingPage(),
          "/newsPage": (_) => NewsPage(),
          "/resource": (_) => ResourcePage(),
          "/bottomMenu": (_) => BottomMenuPage(),
          "/writeSomething": (_) => WritePage(),
        },
      ),
    );
  }
}
