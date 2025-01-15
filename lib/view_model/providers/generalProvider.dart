
import 'package:flutter/material.dart';

class GeneralProvider extends ChangeNotifier{

  bool isVisibleFirst = true;
  void iconToggleFirst(){
    isVisibleFirst = !isVisibleFirst;
    notifyListeners();
  }


  bool isVisibleSecond = true;
  void iconToggleSecond(){
    isVisibleSecond = !isVisibleSecond;
    notifyListeners();
  }
}