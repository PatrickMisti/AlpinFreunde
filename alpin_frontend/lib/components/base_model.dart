
import 'package:alpin_frontend/services/disposabled.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier with DisposableState {



  void setState() {
    notifyListeners();
  }
}