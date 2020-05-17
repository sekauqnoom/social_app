library flutter_datetime_picker;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/model/hobby/hobby_model.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:socialapp/pages/afterlogin/me/date_picker/date_model.dart';
import 'package:socialapp/pages/afterlogin/me/date_picker/i18n_model.dart';
import 'package:socialapp/pages/afterlogin/me/date_picker/datetime_picker_theme.dart';

export 'package:socialapp/pages/afterlogin/me/date_picker/date_model.dart';
export 'package:socialapp/pages/afterlogin/me/date_picker/i18n_model.dart';
export 'package:socialapp/pages/afterlogin/me/date_picker/datetime_picker_theme.dart';

typedef DateChangedCallback(DateTime time);
typedef DateCancelledCallback();
typedef String StringAtIndexCallBack(int index);

class EditInfoPage extends StatefulWidget {
  EditInfoPage(
      {Key key, @required this.route, this.onChanged, this.locale, this.pickerModel});

  final DateChangedCallback onChanged;

  final _DatePickerRoute route;

  final LocaleType locale;

  final BasePickerModel pickerModel;
  @override
  State<StatefulWidget> createState() => EditInfoPageState();
}

class EditInfoPageState extends State<EditInfoPage> with TickerProviderStateMixin{
  String _userId = "啦啦啦";
  String _name = "哈哈哈";
  String _gender = "女";
  DateTime _birthday = DateTime(2000,7,13);
  int _y = DateTime.now().year;    //记录选中的生日年份
  int _m = DateTime.now().month;    //记录选中的生日月份
  int _d = DateTime.now().day;    //记录选中的生日日期
  set birthday(DateTime value) {
    _birthday = value;
  }

  String _sno ="290831";
  int _enrollYear = 2018;
  String _department = "信软";
  String _major = "软件工程";
  hobby _hobby = hobby.movie;
  GlobalKey _formKey = GlobalKey<FormState>();


  //TextEditingController for all information
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _snoController = TextEditingController();
  bool _userIdCorrect = false;
  bool _nameCorrect = false;
  bool _snoCorrect = false;
  String _userIdErrMsg;
  String _nameErrMsg;
  String _snoErrMsg;

  TextEditingController _genderController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();
  TextEditingController _enrollYearController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _majorController = TextEditingController();
  TextEditingController _hobbyController = TextEditingController();

  FixedExtentScrollController leftScrollCtrl, middleScrollCtrl, rightScrollCtrl;

  void refreshScrollOffset() {
//    print('refreshScrollOffset ${widget.pickerModel.currentRightIndex()}');
    leftScrollCtrl =
    new FixedExtentScrollController(initialItem: widget.pickerModel.currentLeftIndex());
    middleScrollCtrl =
    new FixedExtentScrollController(initialItem: widget.pickerModel.currentMiddleIndex());
    rightScrollCtrl =
    new FixedExtentScrollController(initialItem: widget.pickerModel.currentRightIndex());
  }

  @override
  void initState() {
    super.initState();
    refreshScrollOffset();

    _userIdController.text = _userId;
    _nameController.text = _name;
    _snoController.text = _sno;

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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    DatePickerTheme theme = new DatePickerTheme();

//    final _year = new Set<int>();
//    final _month = new Set<int>();
//    final _day = new Set<int>();
//
//    for(int i=0; i < (DateTime.now().year - 1970); i++){
//      _year.add(i+1970);
//    }
//    for(int i=0; i < 12; i++){
//      _month.add(i+1);
//    }
//
////    final _biggerFont = const TextStyle(fontSize: 18.0);
//    final years = _year.map((year) {
//        return new ListTile(
////          title: new Text(year, style: _biggerFont),
//          title: new Text(year.toString()+"年"),
//          onTap: (){
//            setState((){
//              this._y = year;
//            });
//          },
//        );
//      },
//    );
//    final divided_1 = ListTile.divideTiles(
//      context: context,
//      tiles: years,
//    ).toList();
//    final months = _month.map((month) {
//      return new ListTile(
////          title: new Text(year, style: _biggerFont),
//        title: new Text(month.toString()+"月"),
//        onTap: (){
//          setState((){
//            this._m = month;
//          });
//        },
//      );
//    },
//    );
//    final divided_2 = ListTile.divideTiles(
//      context: context,
//      tiles: months,
//    ).toList();
//
//    for(int i=0; i < (calcDateCount(_y,_m)); i++){
//      _day.add(i+1);
//    }
//    final days = _day.map((day) {
//      return new ListTile(
////          title: new Text(year, style: _biggerFont),
//        title: new Text(day.toString()+"日"),
//        onTap: (){
//          setState((){
//            this._d = day;
//          });
//        },
//      );
//    },
//    );
//    final divided_3 = ListTile.divideTiles(
//      context: context,
//      tiles: days,
//    ).toList();

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
                      icon: Icon(Icons.account_box),
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
              child: AnimatedBuilder(
                animation: widget.route.animation,
                builder: (BuildContext context, Widget child) {
                  final double bottomPadding = MediaQuery.of(context).padding.bottom;
                  return ClipRect(
                    child: CustomSingleChildLayout(
                      delegate: _BottomPickerLayout(widget.route.animation.value, theme,
                          showTitleActions: widget.route.showTitleActions, bottomPadding: bottomPadding),
                      child: GestureDetector(
                        child: Material(
                          color: theme.backgroundColor ?? Colors.white,
                          child: _renderPickerView(theme),
                        ),
                      ),
                    ),
                  );
                },
              ),
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

          //个性资料
          new ListTile(
            title: new Text('个性资料'),
          ),
        ],
      ),
    );
  }

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
//  AlertDialog chooseBirthdayDialog(){
//    return AlertDialog(
//      title:Text("选择性别",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700)),
//      content: SizedBox(
//        height: 60.0,
//        child: SingleChildScrollView(
//          child: ListBody(
//            children: <Widget>[
//              GestureDetector(
//                child: Text("男"),
//                onTap: (){
//                  setState((){
//                    this._gender = "男";
//                    Navigator.pop(context);
//                  });
//                },
//              ),
//              Divider(),
//              GestureDetector(
//                child: Text("女"),
//                onTap: (){
//                  setState((){
//                    this._gender = "女";
//                    Navigator.pop(context);
//                  });
//                },
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
  void _notifyDateChanged() {
    if (widget.onChanged != null) {
      widget.onChanged(widget.pickerModel.finalTime());
    }
  }

  Widget _renderPickerView(DatePickerTheme theme) {
    Widget itemView = _renderItemView(theme);
    if (widget.route.showTitleActions) {
      return Column(
        children: <Widget>[
          _renderTitleActionsView(theme),
          itemView,
        ],
      );
    }
    return itemView;
  }

  Widget _renderColumnView(
      ValueKey key,
      DatePickerTheme theme,
      StringAtIndexCallBack stringAtIndexCB,
      ScrollController scrollController,
      int layoutProportion,
      ValueChanged<int> selectedChangedWhenScrolling,
      ValueChanged<int> selectedChangedWhenScrollEnd) {
    return Expanded(
      flex: layoutProportion,
      child: Container(
          padding: EdgeInsets.all(8.0),
          height: theme.containerHeight,
          decoration: BoxDecoration(color: theme.backgroundColor ?? Colors.white),
          child: NotificationListener(
              onNotification: (ScrollNotification notification) {
                if (notification.depth == 0 &&
                    selectedChangedWhenScrollEnd != null &&
                    notification is ScrollEndNotification &&
                    notification.metrics is FixedExtentMetrics) {
                  final FixedExtentMetrics metrics = notification.metrics;
                  final int currentItemIndex = metrics.itemIndex;
                  selectedChangedWhenScrollEnd(currentItemIndex);
                }
                return false;
              },
              child: CupertinoPicker.builder(
                  key: key,
                  backgroundColor: theme.backgroundColor ?? Colors.white,
                  scrollController: scrollController,
                  itemExtent: theme.itemHeight,
                  onSelectedItemChanged: (int index) {
                    selectedChangedWhenScrolling(index);
                  },
                  useMagnifier: true,
                  itemBuilder: (BuildContext context, int index) {
                    final content = stringAtIndexCB(index);
                    if (content == null) {
                      return null;
                    }
                    return Container(
                      height: theme.itemHeight,
                      alignment: Alignment.center,
                      child: Text(
                        content,
                        style: theme.itemStyle,
                        textAlign: TextAlign.start,
                      ),
                    );
                  }))),
    );
  }

  Widget _renderItemView(DatePickerTheme theme) {
    return Container(
      color: theme.backgroundColor ?? Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: widget.pickerModel.layoutProportions()[0] > 0
                ? _renderColumnView(
                ValueKey(widget.pickerModel.currentLeftIndex()),
                theme,
                widget.pickerModel.leftStringAtIndex,
                leftScrollCtrl,
                widget.pickerModel.layoutProportions()[0], (index) {
              widget.pickerModel.setLeftIndex(index);
            }, (index) {
              setState(() {
                refreshScrollOffset();
                _notifyDateChanged();
              });
            })
                : null,
          ),
          Text(
            widget.pickerModel.leftDivider(),
            style: theme.itemStyle,
          ),
          Container(
            child: widget.pickerModel.layoutProportions()[1] > 0
                ? _renderColumnView(
                ValueKey(widget.pickerModel.currentLeftIndex()),
                theme,
                widget.pickerModel.middleStringAtIndex,
                middleScrollCtrl,
                widget.pickerModel.layoutProportions()[1], (index) {
              widget.pickerModel.setMiddleIndex(index);
            }, (index) {
              setState(() {
                refreshScrollOffset();
                _notifyDateChanged();
              });
            })
                : null,
          ),
          Text(
            widget.pickerModel.rightDivider(),
            style: theme.itemStyle,
          ),
          Container(
            child: widget.pickerModel.layoutProportions()[2] > 0
                ? _renderColumnView(
                ValueKey(widget.pickerModel.currentMiddleIndex() * 100 +
                    widget.pickerModel.currentLeftIndex()),
                theme,
                widget.pickerModel.rightStringAtIndex,
                rightScrollCtrl,
                widget.pickerModel.layoutProportions()[2], (index) {
              widget.pickerModel.setRightIndex(index);
              _notifyDateChanged();
            }, null)
                : null,
          ),
        ],
      ),
    );
  }

  // Title View
  Widget _renderTitleActionsView(DatePickerTheme theme) {
    String done = _localeDone();
    String cancel = _localeCancel();

    return Container(
      height: theme.titleHeight,
      decoration: BoxDecoration(
        color: theme.headerColor ?? theme.backgroundColor ?? Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: theme.titleHeight,
            child: CupertinoButton(
              pressedOpacity: 0.3,
              padding: EdgeInsets.only(left: 16, top: 0),
              child: Text(
                '$cancel',
                style: theme.cancelStyle,
              ),
              onPressed: () {
                Navigator.pop(context);
                if (widget.route.onCancel != null) {
                  widget.route.onCancel();
                }
              },
            ),
          ),
          Container(
            height: theme.titleHeight,
            child: CupertinoButton(
              pressedOpacity: 0.3,
              padding: EdgeInsets.only(right: 16, top: 0),
              child: Text(
                '$done',
                style: theme.doneStyle,
              ),
              onPressed: () {
                Navigator.pop(context, widget.pickerModel.finalTime());
                if (widget.route.onConfirm != null) {
                  widget.route.onConfirm(widget.pickerModel.finalTime());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  String _localeDone() {
    return i18nObjInLocale(widget.locale)['done'];
  }

  String _localeCancel() {
    return i18nObjInLocale(widget.locale)['cancel'];
  }
}

class DatePicker {
  ///
  /// Display date picker bottom sheet.
  ///
  static Future<DateTime> showDatePicker(
      BuildContext context, {
        bool showTitleActions: true,
        DateTime minTime,
        DateTime maxTime,
        DateChangedCallback onChanged,
        DateChangedCallback onConfirm,
        DateCancelledCallback onCancel,
        locale: LocaleType.zh,
        DateTime currentTime,
        DatePickerTheme theme,
      }) async {
    return await Navigator.push(
        context,
        new _DatePickerRoute(
            showTitleActions: showTitleActions,
            onChanged: onChanged,
            onConfirm: onConfirm,
            onCancel: onCancel,
            locale: locale,
            theme: theme,
            barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
            pickerModel: DatePickerModel(
                currentTime: currentTime, maxTime: maxTime, minTime: minTime, locale: locale)));
  }

  ///
  /// Display date picker bottom sheet witch custom picker model.
  ///
  static Future<DateTime> showPicker(
      BuildContext context, {
        bool showTitleActions: true,
        DateChangedCallback onChanged,
        DateChangedCallback onConfirm,
        DateCancelledCallback onCancel,
        locale: LocaleType.en,
        BasePickerModel pickerModel,
        DatePickerTheme theme,
      }) async {
    return await Navigator.push(
        context,
        new _DatePickerRoute(
            showTitleActions: showTitleActions,
            onChanged: onChanged,
            onConfirm: onConfirm,
            onCancel: onCancel,
            locale: locale,
            theme: theme,
            barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
            pickerModel: pickerModel));
  }
}

class _DatePickerRoute<T> extends PopupRoute<T> {
  _DatePickerRoute({
    this.showTitleActions,
    this.onChanged,
    this.onConfirm,
    this.onCancel,
    theme,
    this.barrierLabel,
    this.locale,
    RouteSettings settings,
    pickerModel,
  })  : this.pickerModel = pickerModel ?? DatePickerModel(),
        this.theme = theme ?? DatePickerTheme(),
        super(settings: settings);

  final bool showTitleActions;
  final DateChangedCallback onChanged;
  final DateChangedCallback onConfirm;
  final DateCancelledCallback onCancel;
  final DatePickerTheme theme;
  final LocaleType locale;
  final BasePickerModel pickerModel;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  final String barrierLabel;

  @override
  Color get barrierColor => Colors.black54;

  AnimationController _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController = BottomSheet.createAnimationController(navigator.overlay);
    return _animationController;
  }

  @override
  Widget buildPage(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    Widget bottomSheet = new MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: EditInfoPage(
        onChanged: onChanged,
        locale: this.locale,
        route: this,
        pickerModel: pickerModel,
      ),
    );
    ThemeData inheritTheme = Theme.of(context, shadowThemeOnly: true);
    if (inheritTheme != null) {
      bottomSheet = new Theme(data: inheritTheme, child: bottomSheet);
    }
    return bottomSheet;
  }
}

class _BottomPickerLayout extends SingleChildLayoutDelegate {
  _BottomPickerLayout(this.progress, this.theme,
      {this.itemCount, this.showTitleActions, this.bottomPadding = 0});

  final double progress;
  final int itemCount;
  final bool showTitleActions;
  final DatePickerTheme theme;
  final double bottomPadding;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    double maxHeight = theme.containerHeight;
    if (showTitleActions) {
      maxHeight += theme.titleHeight;
    }

    return new BoxConstraints(
        minWidth: constraints.maxWidth,
        maxWidth: constraints.maxWidth,
        minHeight: 0.0,
        maxHeight: maxHeight + bottomPadding);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double height = size.height - childSize.height * progress;
    return new Offset(0.0, height);
  }

  @override
  bool shouldRelayout(_BottomPickerLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}


