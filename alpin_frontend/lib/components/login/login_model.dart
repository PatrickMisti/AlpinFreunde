import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/services/login-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginModel extends BaseModel {
  final GetIt _getIt = GetIt.I;
  late FormGroup settingsForm;
  final BuildContext _context;

  bool isCheck = false;
  //services
  late LoginService _loginService;

  FormControl<bool> get submitButton => settingsForm.control('submit') as FormControl<bool>;

  LoginModel(this._context) : super() {
    _getIt.registerLazySingleton(() => LoginService());
    _loginService = _getIt.get<LoginService>();
    settingsForm = FormGroup({
      'email': FormControl<String>(validators: [Validators.required, Validators.email]),
      'password': FormControl<String>(validators: [Validators.required, Validators.minLength(6)]),
      'submit': FormControl<bool>(value: false)
    });

    settingsForm.control('email').valueChanges
        .listen((item) => submitButton.value = settingsForm.valid);
    settingsForm.control('password').valueChanges
        .listen((item) => submitButton.value = settingsForm.valid);
  }

  signIn() {}

}
