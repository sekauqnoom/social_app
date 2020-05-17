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
  ScrollController _scrollController;
  List<News> newsList;
  int newsLength;
  int displayLength;

  List<Resource> pdf_search_site = [
    Resource("鸠摩搜书", "https://www.jiumodiary.com/", "免费提供pdf电子书的网站"),
    Resource("脚本之家", "https://www.jb51.net/books/", "提供较多电子书，并且提供多种下载方式"),
//    Resource(),
  ];
  List<Resource> learning_video_site = [
    Resource("哔哩哔哩", "https://www.bilibili.com/", "提供海量优质学习教程视频"),
    Resource("慕课网", "https://www.imooc.com/", "提供海量基础入门视频"),
    Resource("网易云课堂", "https://study.163.com/", "提供海量基础入门视频"),
    Resource("中国大学MOOC", "https://www.icourse163.org/", "提供各大高校教学视频")
  ];
  List<Resource> no_video_learning_site = [
    Resource("菜鸟教程", "https://www.runoob.com/", "多种入门教程，并且提供多种在线运行环境"),
    Resource("W3Schools", "https://www.w3schools.com/", "提供较多电子书，并且提供多种下载方式"),
//    Resource(),
  ];

  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController(
      keepScrollOffset: false,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

//  @override
//  Widget build(BuildContext context){
////    return Scaffold(
////        appBar: AppBar(
////          automaticallyImplyLeading: false,
////          title: Text("首页", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
////        ),
////      body:Text(""),
////    );
//  }
  void get_data() async{
    var data = await html_parse();
    setState(() {
      newsList = data;
      newsLength = data.length;
      displayLength = newsLength > 4 ? 11 : (newsLength + 2)*2 -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: 50,
//              backgroundColor: Colors.white,
              title: Text("首页", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  get_data();
                  if(index == 0){
                    return Row(
                      children: <Widget>[
                        Icon(Icons.event),
                        Text("校园时讯", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),)
                      ],
                    );
                  }
                  else if(index == 9){
                    return FlatButton(
                      //打开外部浏览器访问网站
                      onPressed: (){
                        Navigator.pushNamed(context, "/moreEvents", arguments: {
                          "newslist": newsList,
                          "newlength": newsLength
                        });
                      },
                      child: Text("get more events...",
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline
                          )
                      ),
                    );
                  }
                  else if (index.isEven && index!=10) {
                    int newsNumber = index ~/ 2 -1;
                    return ListTile(
                            title: Text(newsList[newsNumber].title,
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            subtitle: Text(newsList[newsNumber].time,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          onTap: () async{
                            var url = newsList[newsNumber].newsUrl;
                            //调用第三方浏览器访问网页
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
//                            //利用 WebView 访问网页
//                            Navigator.of(context).push(new MaterialPageRoute(builder: (_){
//                              return new Browser(
//                                url: url,
//                                title: newsList[newsNumber].title,
//                              );
//                            }));
                          },
                    );
                  }
                  else {
                    return Divider(
                      height: 5,
                    );
                  }
                },
                  childCount: displayLength
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if(index == 0){
                    return Row(
                      children: <Widget>[
                        Icon(Icons.link),
                        Text("在线学习资源", textAlign:TextAlign.center,style: TextStyle(fontSize: 28.0,),)
                      ],
                    );
                  }
                  if(index == 2){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.book),
                        Text("PDF搜索网站推荐", textAlign:TextAlign.start,style: TextStyle(fontSize: 20.0,),)
                      ],
                    );
                  }
                  else if (index.isEven) {
                    int resourceNumber = index ~/ 2 -2;
                    return ListTile(
                      title: Text(pdf_search_site[resourceNumber].title,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      subtitle: Text(pdf_search_site[resourceNumber].description,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onTap: () async{
                        var url = pdf_search_site[resourceNumber].resourceUrl;
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    );
                  }
                  else {
                    return Divider(
                      height: 5,
                    );
                  }
                },
                    childCount: (pdf_search_site.length+2)*2
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if(index == 0){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.video_library),
                        Text("在线教学视频网站", textAlign:TextAlign.start,style: TextStyle(fontSize: 20.0,),)
                      ],
                    );
                  }
                  else if (index.isEven) {
                    int resourceNumber = index ~/ 2 -1;
                    return ListTile(
                      title: Text(learning_video_site[resourceNumber].title,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      subtitle: Text(learning_video_site[resourceNumber].description,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onTap: () async{
                        var url = learning_video_site[resourceNumber].resourceUrl;
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    );
                  }
                  else {
                    return Divider(
                      height: 5,
                    );
                  }
                },
                    childCount: (learning_video_site.length+1)*2
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if(index == 0){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.web),
                        Text("在线非视频学习网站", textAlign:TextAlign.start,style: TextStyle(fontSize: 20.0,),)
                      ],
                    );
                  }
                  else if (index.isEven) {
                    int resourceNumber = index ~/ 2 -1;
                    return ListTile(
                      title: Text(no_video_learning_site[resourceNumber].title,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      subtitle: Text(no_video_learning_site[resourceNumber].description,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onTap: () async{
                        var url = no_video_learning_site[resourceNumber].resourceUrl;
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    );
                  }
                  else {
                    return Divider(
                      height: 5,
                    );
                  }
                },
                    childCount: (no_video_learning_site.length+1)*2
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}