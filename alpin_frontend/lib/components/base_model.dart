
import 'package:alpin_frontend/model/widget/bottom_navigation_model.dart';
import 'package:alpin_frontend/services/disposabled.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

/// BaseModel handled all main functions from the viewModel's
///
/// [setState] function updated the ui
/// [dispose] function close all streams
class BaseModel extends BaseViewModel with DisposableState, BottomNavigationModel {
  final BuildContext context;

  BaseModel(this.context): super();

  void setState() {
    notifyListeners();
  }

  @override
  void changeIndexNavi(int index) {
    super.changeIndexNavi(index);
    setState();
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }
}