import 'dart:collection';

import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/model/user.dart';
import 'package:alpin_frontend/utilities/form_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInModel extends BaseModel {
  late FormGroup settingsForm;
  bool isRight = true;
  final BuildContext _context;

  SignInModel(this._context) : super() {
    settingsForm = FormGroup({
      'userName': FormControl<String>(validators: [Validators.required]),
      'firstName': FormControl<String>(validators: [Validators.required]),
      'lastName': FormControl<String>(validators: [Validators.required]),
      'email': FormControl<String>(
          validators: [Validators.required, Validators.email]),
      'password': FormControl<String>(
          validators: [Validators.required, Validators.minLength(6)]),
      'emailPush': FormControl<bool>(value: false),
      'push': FormControl<bool>(value: false)
    });

    sink = settingsForm.valueChanges.listen((event) {
      isRight = settingsForm.invalid;
      setState();
    });
  }

  void save() async {
    // todo save login
    // check if username is already used
    if (settingsForm.valid) {
      List<MapEntry<String, Object?>> res = settingsForm.rawValue.entries.toList();
      var user = User(
          userName: res.parseToField('userName'),
          firstName: res.parseToField('firstName'),
          lastName: res.parseToField('lastName'),
          email: res.parseToField('email'),
          password: res.parseToField('password'),
          emailPush: res.parseToField('emailPush'),
          push: res.parseToField('push'));
      //todo push user
    }
  }

  getValueFromForm(String name, List<MapEntry<String, Object?>> user) =>
      user.singleWhere((element) => element.key == name).value;

  void checkFormField(String field, bool hasFocus) {
    if (!hasFocus) {
      // todo check username
      switch (field) {
        case 'userName':
          // checkField with server
          // settingsForm.control('userName').setErrors({'existField': true});
          // settingsForm.control('userName').removeError('existField');
          break;
        case 'email':
          // checkField with server
          // settingsForm.control('email').setErrors({'existField': true});
          // settingsForm.control('email').removeError('existField');
          break;
      }
    }
  }
}
