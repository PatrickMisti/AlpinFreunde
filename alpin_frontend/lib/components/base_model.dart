
import 'package:alpin_frontend/services/disposabled.dart';
import 'package:stacked/stacked.dart';

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