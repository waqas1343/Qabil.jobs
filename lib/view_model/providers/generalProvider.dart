import 'dart:io';
import 'package:flutter/material.dart';


class GeneralProvider extends ChangeNotifier {
  bool isVisibleFirst = true;

  void iconToggleFirst() {
    isVisibleFirst = !isVisibleFirst;
    notifyListeners();
  }

  bool isVisibleSecond = true;

  void iconToggleSecond() {
    isVisibleSecond = !isVisibleSecond;
    notifyListeners();
  }


  int pageIndex = 0;
  bool isClick1 = false;

  void colorChange1() {
    isClick1 = !isClick1;
    notifyListeners();
  }

  void setBotttomNaviagtionIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }


  final List<File> images = [];

  void addImage(File image) {
    images.add(image);
    notifyListeners();
  }

  void removeImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }

  //category selectors

  int iconSelect = 0;
  double? iconSize;

  void isSelected(int index) {
    iconSelect = index;
    iconSelect == iconSize;
    notifyListeners();
  }

 // saveSelects

  final List<dynamic> save = [];

  void saveSelected(int index) {

    if(save.contains(index)) {
      save.removeAt(index);
    }
    else{
      save.add(index);
    }
    notifyListeners();
  }
  bool isSave(int index){
    return save.contains(index);
  }

  //likeSelects

  final List<dynamic> like = [];

  void likeSelected(int index) {

    if(like.contains(index)) {
      like.removeAt(index);
    }
    else{
      like.add(index);
    }
    notifyListeners();
  }
  bool isLike(int index){
    return like.contains(index);
  }
}

