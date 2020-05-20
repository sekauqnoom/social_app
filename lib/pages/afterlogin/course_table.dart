import 'package:flutter/material.dart';
import 'package:socialapp/model/course/course_model.dart';
import 'package:socialapp/model/course/course_count.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CoursePageState();
}

class CoursePageState extends State<CoursePage> {
  List<Course> mondayList = new List();
  List<Course> tuesdayList = new List();
  List<Course> wednesdayList = new List();
  List<Course> thursdayList = new List();
  List<Course> fridayList = new List();
  List<Course> saturdayList = new List();
  List<Course> sundayList = new List();

  @override
  Widget build(BuildContext context){

    //整理一周中每天的课程
    Provider.of<CourseCounter>(context).initCourseList();
    var courseList = Provider.of<CourseCounter>(context).courseList;
    // 整理周一到周五各天的课程列表
    if(mondayList.length==0 && tuesdayList.length==0 && wednesdayList.length==0&&
        thursdayList.length==0&& fridayList.length==0&& saturdayList.length==0&& sundayList.length==0){
      for (Course course in courseList) {
        switch (course.weekday) {
          case 1:
            mondayList.add(course);
            break;
          case 2:
            tuesdayList.add(course);
            break;
          case 3:
            wednesdayList.add(course);
            break;
          case 4:
            thursdayList.add(course);
            break;
          case 5:
            fridayList.add(course);
            break;
          case 6:
            saturdayList.add(course);
            break;
          case 7:
            sundayList.add(course);
            break;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("我的课程", textAlign:TextAlign.start,style: TextStyle(fontSize: 28.0,),),
      ),
      body: new Container(
//        margin: new EdgeInsets.only(top: 50.0),
        child: new DefaultTabController(
          length: 7,
          child: new Scaffold(
              appBar: new AppBar(
                backgroundColor: Colors.orangeAccent,
                title: new TabBar(
                  tabs: [
                    new Tab(text: "周一"),
                    new Tab(text: "周二"),
                    new Tab(text: "周三"),
                    new Tab(text: "周四"),
                    new Tab(text: "周五"),
                    new Tab(text: "周六"),
                    new Tab(text: "周日"),
                  ],
                  indicatorColor: Colors.white,
                  isScrollable: true,
                ),
              ),
              body: new Stack(
                children: <Widget>[
                  new TabBarView(
                    children: [
                      new KbList(
                        page: 1,
                        itemCount: mondayList.length,
                        list: mondayList,
                      ),
                      new KbList(
                        page: 2,
                        itemCount: tuesdayList.length,
                        list: tuesdayList,
                      ),
                      new KbList(
                        page: 3,
                        itemCount: wednesdayList.length,
                        list: wednesdayList,
                      ),
                      new KbList(
                        page: 4,
                        itemCount: thursdayList.length,
                        list: thursdayList,
                      ),
                      new KbList(
                        page: 5,
                        itemCount: fridayList.length,
                        list: fridayList,
                      ),
                      new KbList(
                        page: 6,
                        itemCount: saturdayList.length,
                        list: saturdayList,
                      ),
                      new KbList(
                        page: 7,
                        itemCount: sundayList.length,
                        list: sundayList,
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class KbList extends StatefulWidget {
  KbList({@required this.page, @required this.itemCount, @required this.list});

  final int page; //用于判断当前是周几
  final int itemCount; //用于表示当前天有多少节课
  final List<Course> list; //当前天的所有的课的集合

  @override
  KbListState createState() => new KbListState();
}

class KbListState extends State<KbList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: widget.itemCount,
        itemBuilder: buildItem
    );
  }

  //一周中某一天的某次课
  Widget buildItem(BuildContext context, int index) {
    return new GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => new AlertDialog(
              title:Text(widget.list[index].courseName,style: TextStyle(color: Colors.teal[500],fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
              content: new Container(
                width: 500,
                height: 180,
                child: new SingleChildScrollView(
//                  mainAxisSize: MainAxisSize.min,
//                  crossAxisAlignment: CrossAxisAlignment.start,
                  child: ListBody(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          Icon(Icons.format_list_numbered),
                          Text(' 课程号：' + widget.list[index].courseId, style: new TextStyle(fontSize: 16.0)),
                        ],
                      ),
                      Divider(
                        height: 5,
                        color: Colors.white,
                      ),
                      new Row(
                        children: <Widget>[
                          Icon(Icons.person),
                          Text(' 老师：' + widget.list[index].teacher, style: new TextStyle(fontSize: 16.0)),
                        ],
                      ),
                      Divider(
                        height: 5,
                        color: Colors.white,
                      ),
                      new Row(
                        children: <Widget>[
                          Icon(Icons.location_on),
                          Text(' 教室：' + widget.list[index].classRoom, style: new TextStyle(fontSize: 16.0)),
                        ],
                      ),
                      Divider(
                        height: 5,
                        color: Colors.white,
                      ),
                      new Row(
                        children: <Widget>[
                          Icon(Icons.watch_later),
                          Text(' 节次：' + time(widget.list[index]), style: new TextStyle(fontSize: 16.0)),
                        ],
                      ),
                      Divider(
                        height: 5,
                        color: Colors.white,
                      ),
                      new Row(
                        children: <Widget>[
                          Icon(Icons.calendar_today),
                          Text(' 周数：' + widget.list[index].week, style: new TextStyle(fontSize: 16.0)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
      child: new KbItem(
        course: widget.list[index],
      ),
    );
  }
  String time(Course c){
    switch(c.classTime){
      case 1:
        return '1-2节（8:30-10:05）';
        break;
      case 2:
        return '3-4节（10:20-11:55）';
        break;
      case 3:
        return '5-6节（14:30-16:05）';
        break;
      case 4:
        return '7-8节（16:20-17:55）';
        break;
      case 5:
        return '9-10节（7:30-21:05）';
        break;
    }
  }

}

class KbItem extends StatefulWidget {
  final Course course;

  KbItem({
    @required this.course,
  });

  @override
  KbItemState createState() => new KbItemState();
}

class KbItemState extends State<KbItem> {
  String time(Course c){
    switch(c.classTime){
      case 1:
        return '1-2节（8:30-10:05）';
        break;
      case 2:
        return '3-4节（10:20-11:55）';
        break;
      case 3:
        return '5-6节（14:30-16:05）';
        break;
      case 4:
        return '7-8节（16:20-17:55）';
        break;
      case 5:
        return '9-10节（7:30-21:05）';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Course course = widget.course;
    return new Card(
      margin: new EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      elevation: 5,
      child: new ListTile(
        title: new Text(course.courseName,
            style: new TextStyle(fontWeight: FontWeight.w500)),
        subtitle: new Text(course.classRoom + '\n' + '节次：'+ time(course)),
        leading: Icon(Icons.add_alarm),
      ),
    );
  }
}