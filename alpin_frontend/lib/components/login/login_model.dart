import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/services/login-service.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginModel extends BaseModel {
  final _getIt = GetIt.instance;
  late FormGroup settingsForm;

  bool isCheck = false;
  //services
  late LoginService _loginService;

  FormControl<bool> get submitButton => settingsForm.control('submit') as FormControl<bool>;

  LoginModel() : super() {
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

  test() {
    if(settingsForm.invalid) return null;
    return () => print("asdf");
  }

  signIn() {}

}
