import 'package:flutter/material.dart';
import '../../../models/post_model/post_model.dart';
import '../query_post_controller/query_post_controller.dart';

class PostCardController extends ChangeNotifier {
  int _currentIndex = 0;
  int _counter = 0;
  bool _isSaved = false;
  bool _isLike = false;

  int get currentIndex => _currentIndex;
  bool get isSaved => _isSaved;
  int get counter => _counter;
  bool get isLike => _isLike;

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
    if (_isLike) {
      _counter--;
    } else {
      _counter++;
    }
    _isLike = !_isLike;
    notifyListeners();
  }
}
