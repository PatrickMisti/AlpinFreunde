import 'package:alpin_frontend/components/base_model.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInModel extends BaseModel {
  late FormGroup settingsForm;
  SignInModel() {
    settingsForm = FormGroup({
      'userName': FormControl<String>(validators: [Validators.required]),
      'firstName': FormControl<String>(validators: [Validators.required]),
      'lastName': FormControl<String>(validators: [Validators.required]),
      'password': FormControl<String>(validators: [Validators.required]),
      'emailPush': FormControl<bool>(value: false),
      'push': FormControl<bool>(value: false)
    });
  }

}