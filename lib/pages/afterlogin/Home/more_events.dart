import 'package:flutter/material.dart';
import 'package:socialapp/model/news/spider_news.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreEventsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MoreEventsPageState();
}

class MoreEventsPageState extends State<MoreEventsPage> with SingleTickerProviderStateMixin{
  ScrollController _scrollController;

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

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context).settings.arguments;
    List<News> newsList = args["newslist"];
    int displayLength = args["newlength"] *2 + 1;
    return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                leading: GestureDetector(
                  child: Icon(Icons.arrow_back_ios),
                  onTap: (){
                    Navigator.pop(context);
                    },
                ),
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: 50,
//              backgroundColor: Colors.white,
                title: Text("校园时讯", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
              ),

              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (index.isOdd) {
                      int newsNumber = index ~/ 2;
                      return ListTile(
//                        dense: true,
                        title: Text(newsList[newsNumber].title,
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 20
                          ),
                          textAlign: TextAlign.start,
                        ),
                        subtitle: Text(newsList[newsNumber].time + " : "+ newsList[newsNumber].description,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        onTap: () async{
                          var url = newsList[newsNumber].newsUrl;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      );
                    }
                    else if(index == displayLength - 1){
                      return Text("no more events",
                          style: TextStyle(color: Colors.grey, fontSize: 30),
                        textAlign: TextAlign.center,
                      );
                    }
                    else {
                      return Divider(
                        height: 5,
                      );
                    }
                  },
//                  childCount: newsList.length*2 + 1,
                      childCount: displayLength
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
  }