
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {

  void setState() {
    notifyListeners();
  }
}