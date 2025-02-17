import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  final List<Map<String, String>> posts = [
    {
      'name': 'Abdul Rehman Rashid',
      'time': '2 Hour ago',
      'title':
          'How to change background lorem ipsum ...asdkasdjla kjsadkadsh kajshdkahdskahdskahds askjdhakjd kjasdhkjasde',
      'likes': '0',
      'comments': '0',
      'image': 'assets/images/profileimage.png',
      'postImage': 'assets/images/profileimage.png',
    },
    {
      'name': 'Ali Ahmed',
      'time': '3 Hour ago',
      'title': 'Creating vector art ...Read More',
      'likes': '0',
      'comments': '0',
      'image': 'assets/images/profileimage.png',
      'postImage': 'assets/images/profileimage.png',
    },
    {
      'name': 'Sara Khan',
      'time': '5 Hour ago',
      'title': 'UI/UX design tips ...Read More',
      'likes': '0 ',
      'comments': '0',
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
