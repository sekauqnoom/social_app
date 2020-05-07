import 'package:flutter/material.dart';
import 'package:socialapp/model/comment/comment_model.dart';

class CommentCounter extends ChangeNotifier{
  var _commentList = List<Comment>();

  get commentList => _commentList;

  set commentList(value) {
    _commentList = value;
  }

  void addComment(Comment comment) {
    _commentList.add(comment);
    notifyListeners();
  }

}
