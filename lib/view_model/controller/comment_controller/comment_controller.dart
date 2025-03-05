import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentController extends ChangeNotifier {
  String formattedTime =
      DateFormat('hh:mm a, dd MMM yyyy').format(DateTime.now());
  final TextEditingController commentController = TextEditingController();
  int? replyIndex;
  final TextEditingController replyController = TextEditingController();

  List<Map<String, dynamic>> commentsList = [
    {
      "username": "Username",
      "comment": "This is a sample comment.",
      "time": "Just now",
      "replies": []
    }
  ];

  void addComment(String username, String commentText) {
    if (commentText.isNotEmpty) {
      commentsList.add({
        "username": username,
        "comment": commentText,
        "time": formattedTime,
        "replies": []
      });
      commentController.clear();
      notifyListeners();
    }
  }

  void addReply(int index, String username, String replyText) {
    if (replyText.isNotEmpty) {
      commentsList[index]["replies"].add({
        "username": username,
        "comment": replyText,
        "time": formattedTime,
      });
      replyIndex = null;
      notifyListeners();
    }
  }

  void showReply(int index) {
    replyIndex = (replyIndex == index) ? null : index;
    notifyListeners();
  }
}
