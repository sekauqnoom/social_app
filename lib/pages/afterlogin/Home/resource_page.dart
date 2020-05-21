import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:socialapp/model/study_resources.dart';
import 'browser.dart';

class ResourcePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResourcePageState();
}

class ResourcePageState extends State<ResourcePage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context){
    int total = (pdf_search_site.length+1)*2 + (learning_video_site.length+1)*2 +(no_video_learning_site.length+1)*2;

    return new Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading: false,
//              backgroundColor: Colors.white,
          title: Text("在线学习资源", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
          centerTitle: true,
        ),

        body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: total,
          itemBuilder: (context, index){
            if(index< (pdf_search_site.length+1)*2){
              if(index == 0){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.book),
                    Text("PDF搜索网站推荐", textAlign:TextAlign.start,style: TextStyle(fontSize: 20.0,),)
                  ],
                );
              }
              else if (index.isEven) {
                int resourceNumber = index ~/ 2 -1;
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
//                    onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
//                      return new Browser(url: pdf_search_site[resourceNumber].resourceUrl,title: pdf_search_site[resourceNumber].title,);
//                    })),
                );
              }
              else {
                return Divider(
                  height: 5,
                );
              }
            }
            else if(index< (pdf_search_site.length+1)*2 + (learning_video_site.length+1)*2){
              index = index - (pdf_search_site.length+1)*2;
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
            }
            else{
              index = index - (pdf_search_site.length+1)*2 - (learning_video_site.length+1)*2;
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
            }
          },
        ),
    );

  }
}