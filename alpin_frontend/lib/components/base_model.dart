
import 'package:alpin_frontend/services/disposabled.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

/// BaseModel handled all main functions from the viewModel's
///
/// [setState] function updated the ui
/// [dispose] function close all streams
class BaseModel extends BaseViewModel with DisposableState {
  final BuildContext context;

  BaseModel(this.context): super() {
    afterViewInit();
  }

  void setState() {
    notifyListeners();
  }



  void afterViewInit() {
    // implement afterViewInit
    // to call after view WidgetsBinding.instance?.addPostFrameCallback()
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }
}