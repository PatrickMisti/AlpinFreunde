
import 'package:alpin_frontend/config.dart';
import 'package:alpin_frontend/services/disposabled.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

/// BaseModel handled all main functions from the viewModel's
///
/// [setState] function updated the ui
/// [dispose] function close all streams
class BaseModel extends BaseViewModel with DisposableState {
  int naviIndex = 0;
  final BuildContext context;

  BaseModel(this.context);

  void setState() {
    notifyListeners();
  }

  void changeIndexNavi(int index) {
    if (index == naviIndex) return;

    naviIndex = index;
    Navigator.of(context).pushNamed(Config.bottomNaviConfig[index].value);
    setState();
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }
}