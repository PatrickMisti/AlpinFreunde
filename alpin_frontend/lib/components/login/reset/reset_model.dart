import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/services/login-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ResetPasswordModel extends BaseModel {
  final _getIt = GetIt.instance;
  late int steps;
  late FormGroup changePasswordSettings;
  late FormControl<String> email;
  late String twoFacCode;
  late bool isFacCodeCorrect;
  // services
  late LoginService _loginService;
  // context
  final BuildContext _context;


  ResetPasswordModel(this._context) : super() {
    _loginService = _getIt.get<LoginService>();
    steps = 0;
    isFacCodeCorrect = false;
    email = FormControl<String>(value: '',validators: [Validators.required, Validators.email]);
    changePasswordSettings = FormGroup({
      'new': FormControl<String>(validators: [Validators.minLength(6),Validators.required]),
      'newConfirmation': FormControl<String>()
    },validators: [
      Validators.mustMatch('new', 'newConfirmation') //todo old and new not be same
    ]);
  }

  onStepContinued() async {
    var isReadyToContinued = true;
    switch(steps) {
      case 0:
        isReadyToContinued = email.valid ? true : false;
        if (email.valid)
          twoFacCode = await _loginService.sendEmailForCode(email.value!);
        else
          email.markAsTouched();
        break;
      case 1:
        isReadyToContinued = isFacCodeCorrect;
        break;
      case 2:
        if (changePasswordSettings.valid) {
          String newPass = changePasswordSettings.control('new').value;
          var isSaved = await _loginService.sendNewPassword(newPass);
          return Navigator.of(_context).pop();
        }
    }

    if (steps == 2) return;
    isReadyToContinued ? steps++ : null;
    setState();
  }

  onStepCancel() {
    switch(steps) {
      case 0:
        return;
      case 2:
        changePasswordSettings.reset();
        break;
    }
    steps--;
    setState();
  }
}