import 'package:flutter/material.dart';
import 'package:socialapp/model/news/spider_news.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:socialapp/model/study_resources.dart';
import 'browser.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
//  ScrollController _scrollController;
  List<News> newsList;
  int newsLength;

  @override
  void initState(){
    super.initState();
//    _scrollController = ScrollController(
//      keepScrollOffset: false,
//    );
  }

  @override
  void dispose() {
//    _scrollController.dispose();
    super.dispose();
  }

  void get_data() async{
    var data = await html_parse();
    setState(() {
      newsList = data;
      newsLength = data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    get_data();
    return new Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
//              backgroundColor: Colors.white,
          title: Text("首页", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
        ),
        body: ListView(
          children: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/moreEvents", arguments: {
                "newslist": newsList,
                "newlength" :newsLength
              }),
              child: new Card(
                elevation: 10.0,
                margin: new EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                color: Color.fromARGB(0, 255, 255, 255),
                child: new Container(
                  width: 400.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    image: new DecorationImage(
                        image: new AssetImage("images/newsCard.png"),
                        fit: BoxFit.cover),
                    shape: BoxShape.rectangle, // <-- 这里需要设置为 rectangle
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(
                          15.0), // <-- rectangle 时，BorderRadius 才有效
                    ),
                  ),
                ),
              ),
            ),
            new GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/resource" ),
              child: new Card(
                elevation: 10.0,
                margin: new EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                color: Color.fromARGB(0, 255, 255, 255),
                child: Stack(
                  children: <Widget>[
                    new Container(
                      width: 400.0,
                      height: 200.0,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        image: new DecorationImage(
                            image: new AssetImage("images/resourceCard.png"),
                            fit: BoxFit.cover),
                        shape: BoxShape.rectangle, // <-- 这里需要设置为 rectangle
                        borderRadius: new BorderRadius.all(
                          const Radius.circular(
                              15.0), // <-- rectangle 时，BorderRadius 才有效
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Text('学习资源',
                        style: TextStyle(
                            color: Color.fromARGB(255, 119, 136, 213),
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Positioned(
                      left: 10.0,
                      top: 50.0,
                      child: Container(
                        width: 60.0,
                        height: 20.0,
                        child: Text('点击进入',textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                        decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 119, 136, 213),
                          shape: BoxShape.rectangle, // <-- 这里需要设置为 rectangle
                          borderRadius: new BorderRadius.all(Radius.circular(5.0)), // <-- rectangle 时，BorderRadius 才有效
                        ),
                      ),
                    ),
//                    new Padding(
//                      // 分别指定四个方向的补白
//                      padding: const EdgeInsets.fromLTRB(20.0, 16.0, 50.0, 50.0),
//                      child: Text('点击进入',),
//                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}