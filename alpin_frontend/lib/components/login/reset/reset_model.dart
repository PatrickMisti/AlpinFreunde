import 'package:alpin_frontend/components/base_model.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ResetPasswordModel extends BaseModel {
  late int steps;
  late FormGroup settingsForm;


  ResetPasswordModel() {
    steps = 0;
    settingsForm = FormGroup({

    });
  }
}