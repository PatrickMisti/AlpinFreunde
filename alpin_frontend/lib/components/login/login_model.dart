import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginModel extends BaseModel {
  final _getIt = GetIt.instance;
  late FormGroup settingsForm;

  LoginModel() {
    settingsForm = FormGroup({
      'email': FormControl<String>(
          value: '', validators: [Validators.required, Validators.email]),
      'password': FormControl<String>(
          value: '', validators: [Validators.required, Validators.minLength(6)]),
      'submit': FormControl<bool>(value: false)
    });

    sink = settingsForm.control('email').valueChanges.listen((event) {
      settingsForm.control('submit').value = settingsForm.dirty && settingsForm.valid;
    });

    sink = settingsForm.control('password').valueChanges.listen((event) {
      settingsForm.control('submit').value = settingsForm.dirty && settingsForm.valid;
    });
  }

  signIn() {}
}
