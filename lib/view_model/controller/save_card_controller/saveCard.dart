import 'package:flutter/material.dart';

class SavedCardProvider extends ChangeNotifier {
  final List<Map<String, String>> savedPosts = [];

  void toggleSavePost(post) {
    if (savedPosts.contains(post)) {
      savedPosts.remove(post);
    } else {
      savedPosts.add(post);
    }
    notifyListeners();
  }

  bool thumbsUp = false;

  void ClickedThumbsUp(post){
    thumbsUp = !thumbsUp;
    savedPosts.contains(post);
  }

  bool comment = false;

  void ClickedComment(post){
    comment = !comment;
    savedPosts.contains(post);

  }

  bool isSaved(post) {
    return savedPosts.contains(post);
  }
}
