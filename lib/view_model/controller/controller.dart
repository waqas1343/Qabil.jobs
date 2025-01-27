import 'package:flutter/cupertino.dart';
class GeneralProvider extends ChangeNotifier {

  // bool update = false;
  // void reSize (){
  //   update = !update;
  // }
  int iconSelect = 0;
  double? iconSize;

  void isSelected(int index) {
    iconSelect = index;
    iconSelect == iconSize;
    notifyListeners();
  }

}




// == comparasion
// = assignment
