import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../save_card_controller/saveCard.dart';

class PostProvider with ChangeNotifier {

  int count = 0;

  final List<Map<String, String>> posts = [
    {
      'name': 'Abdul Rehman Rashid',
      'time': '2 Hour ago',
      'title': 'Flutter Custom Widget',

      'title2': 'Custom widgets are user-defined components that can be used to display data, information, or features.',

      'likes': '${0}',
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
