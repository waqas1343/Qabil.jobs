import 'package:flutter/material.dart';
import '../../../models/post_model/post_model.dart';
import '../query_post_controller/query_post_controller.dart';

class PostCardController extends ChangeNotifier {
  int _currentIndex = 0;
  bool _isSaved = false;
  int _counter = 0;

  int get currentIndex => _currentIndex;
  bool get isSaved => _isSaved;
  int get counter => _counter;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void toggleSavePost(PostModel post, QueryController queryController) {
    _isSaved = !_isSaved;
    queryController.savePost(post);
    notifyListeners();
  }

  void likeCounter() {
    _counter++;
    notifyListeners();
  }
}
