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

  bool isSaved(post) {
    return savedPosts.contains(post);
  }
}
