import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/model/user.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditProfileModel extends BaseModel {
  late FormGroup settingsForm;
  bool loading = false;

  EditProfileModel(User? user, BuildContext context) : super(context) {
    settingsForm = FormGroup({
      'firstName': FormControl<String>(validators: [Validators.required]),
      'lastName': FormControl<String>(validators: [Validators.required]),
      'userName': FormControl<String>(validators: [Validators.required]),
      'email': FormControl<String>(validators: [Validators.required, Validators.email]),
    });

    updateForm(user);
  }

  updateForm(User? user) {
    if (user == null) return;

    settingsForm.patchValue({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'userName': user.userName,
      'email': user.email
    });
  }

  save() async {
    loading = true;
    setState();

    //review save
    await Future.delayed(const Duration(seconds: 10));

    // review: if saved true
    // if (true) Navigator.of(_context).pop();
    loading = false;
    setState();
  }

}