import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/services/login_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginModel extends BaseModel {
  final GetIt _getIt = GetIt.I;
  late FormGroup settingsForm;
  bool isFormChecked = false;

  //services
  late LoginService _loginService;

  FormControl<bool> get submitButton =>
      settingsForm.control('submit') as FormControl<bool>;

  LoginModel(BuildContext context) : super(context) {
    _getIt.registerLazySingleton(() => LoginService());
    _loginService = _getIt.get<LoginService>();
    settingsForm = FormGroup({
      'email': FormControl<String>(
          validators: [Validators.required, Validators.email]),
      'password': FormControl<String>(
          validators: [Validators.required, Validators.minLength(6)])
    });

    settingsForm.valueChanges.listen((event) {
      isFormChecked = settingsForm.valid;
      setState();
    });
  }

  signIn() {}

  save() {
    //todo
    _getIt.unregister(instance: _loginService);
  }

  void pushRoute(String route) => route != 'overview'
      ? Navigator.of(context).pushNamed('/$route')
      : Navigator.of(context).pushReplacementNamed('/$route');


}
