
import 'package:alpin_frontend/services/disposabled.dart';
import 'package:stacked/stacked.dart';

/// BaseModel handled all main functions from the viewModel's
///
/// [setState] function updated the ui
/// [dispose] function close all streams
class BaseModel extends BaseViewModel with DisposableState {

  BaseModel();

  void setState() {
    notifyListeners();
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }
}