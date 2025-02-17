import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  final List<Map<String, String>> posts = [
    {
      'name': 'Abdul Rehman Rashid',
      'time': '2 Hour ago',
      'title': 'How to change background ...Read More',
      'likes': '42K',
      'comments': '52K',
      'image': 'assets/images/profileimage.png',
      'postImage': 'assets/images/profileimage.png',
    },
    {
      'name': 'Ali Ahmed',
      'time': '3 Hour ago',
      'title': 'Creating vector art ...Read More',
      'likes': '35K',
      'comments': '45K',
      'image': 'assets/images/profileimage.png',
      'postImage': 'assets/images/profileimage.png',
    },
    {
      'name': 'Sara Khan',
      'time': '5 Hour ago',
      'title': 'UI/UX design tips ...Read More',
      'likes': '28K',
      'comments': '38K',
      'image': 'assets/images/profileimage.png',
      'postImage': 'assets/images/profileimage.png',
    },
  ];

  final List<Map<String, String>> savedPosts = [];

  void toggleSavePost(Map<String, String> post) {
    if (savedPosts.contains(post)) {
      savedPosts.remove(post);
    } else {
      savedPosts.add(post);
    }
    notifyListeners();
  }

  bool isPostSaved(Map<String, String> post) {
    return savedPosts.contains(post);
  }
}
