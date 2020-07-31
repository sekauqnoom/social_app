import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'package:socialapp/model/shared_dynamics/dynamic_model.dart';
import 'package:socialapp/model/shared_dynamics/dynamic_count.dart';

class DynamicsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DynamicsPageState();
}

class DynamicsPageState extends State<DynamicsPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("好友动态", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            new PopupMenuButton(
              offset: const Offset(0.0, 60.0),
              icon: new Icon(Icons.add, color: Colors.white),
              onSelected: (int value) {
                startMenuButton(value,context);
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                new PopupMenuItem<int>(
                    value: 0,
                    child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
//                                    new Image.asset(group, width: 30.0, height: 30.0),
                                new Icon(Icons.add_a_photo, color: Colors.black,),
                                new Text('  发布心情',
                                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                                )
                              ],
                            ),
                          ],
                        ))),
              ],
            ),
          ]
      ),
      body: Consumer<DynamicCounter>(
        builder: (context, counter, child) => ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount:  counter.dynamicList.length,
          itemBuilder: (context, index){
            Dynamic currentDynamic = counter.dynamicList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      //头像
                      new Container(
                        width: 40.0,
                        height: 40.0,
//                        margin: EdgeInsets.only(right: 10.0, bottom: 15.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(currentDynamic.headpic),
                            fit: BoxFit.fitHeight,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      new Text(
                        currentDynamic.userName + '    ',
                        style: new TextStyle(
                            color: Colors.black, fontSize: 25.0),
                      ),
                      new Text(
                        currentDynamic.dateTime,
                        style: new TextStyle(
                            color: Colors.grey, fontSize: 20.0),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(currentDynamic.text, style: TextStyle(fontSize: 20.0), textAlign: TextAlign.left,),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Offstage(
                    offstage: currentDynamic.images.length==0,
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 8, left: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
//                          SizedBox(
//                            height: 8,
//                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            runSpacing: 10,
                            spacing: 10,
                            children: List.generate(currentDynamic.images.length, (i) {
                              return GestureDetector(
                                child: currentDynamic.images[i],
                                onTap: (){
                                  Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (c, a, s) => PreviewImagesWidget(currentDynamic.imageUrls, initialPage: i,)));
                                },
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  ///
  /// 菜单按钮点击的事件
  ///
  startMenuButton(int value, BuildContext context) {
    switch (value) {
      case 0:
        Navigator.pushNamed(context, "/writeSomething");
        break;
      case 1:
        break;
      case 2:
//        startScan();
        break;
      case 3:
        break;
    }
  }
}

class PreviewImagesWidget extends StatefulWidget {
  ///图片Lst
  final List imageList;

  ///初始展示页数。默认0
  int initialPage;

  ///选中的页的点的颜色
  Color checkedColor;

  ///未选中的页的点的颜色
  Color uncheckedColor;

  PreviewImagesWidget(this.imageList,
      {this.initialPage = 0,
        this.checkedColor = Colors.white,
        this.uncheckedColor = Colors.grey});

  @override
  _PreviewImagesWidgetState createState() =>
      _PreviewImagesWidgetState(initialPage: initialPage);
}

class _PreviewImagesWidgetState extends State<PreviewImagesWidget> {
  PageController pageController;
  int nowPosition;
  int initialPage;
  List<Widget> dotWidgets;

  _PreviewImagesWidgetState({this.initialPage = 0});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nowPosition = initialPage;
    pageController = PageController(initialPage: initialPage);
    _initData();
  }

  void _initData() {
    dotWidgets = [];
    if (widget.imageList.length > 1) {
      for (int i = 0; i < widget.imageList.length; i++) {
        dotWidgets.add(_buildDots(i));
      }
    }
  }

  Widget _buildDots(int index) => Container(
    margin: EdgeInsets.all(5),
    child: ClipOval(
      child: Container(
        color: index == nowPosition
            ? widget.checkedColor
            : widget.uncheckedColor,
        width: 5.0,
        height: 5.0,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity >= 0) {
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PhotoViewGallery.builder(
            onPageChanged: (index) {
              setState(() {
                nowPosition = index;
                _initData();
              });
            },
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: FileImage(widget.imageList[index]),
              );
            },
            itemCount: widget.imageList.length,
            pageController: pageController,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Wrap(
              children: dotWidgets,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
}