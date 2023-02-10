
import 'package:flutter/cupertino.dart';

class BottomNavigationModel {
  int naviIndex = 3;

  void changeIndexNavi(int index) {
    if (index == naviIndex) return;

    naviIndex = index;
  }
}