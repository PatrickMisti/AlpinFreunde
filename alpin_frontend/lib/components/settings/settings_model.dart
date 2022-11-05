import 'dart:developer';

import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/components/settings/edit_profile/edit_profile_view.dart';
import 'package:alpin_frontend/model/widget/list_tile_model.dart';
import 'package:alpin_frontend/routing.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/services/login_service.dart';
import 'package:alpin_frontend/utilities/mock/MockData.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// get all [services] and setup [user], [translations], [theme] usw
///
/// update all changes to backend
class SettingsModel extends BaseModel {
  final GetIt getIt = GetIt.I;

  // final BuildContext context;
  late FormControl<bool> themeModeSwitch;
  late FormControl<bool> emailPushSwitch;
  late FormControl<bool> pushSwitch;

  // services
  late LoginService _loginService;

  SettingsModel(BuildContext context) : super(context) {
    themeModeSwitch = FormControl<bool>();
    emailPushSwitch = FormControl<bool>();
    pushSwitch = FormControl<bool>();

    sink = themeModeSwitch.valueChanges.listen((event) {
      log(event.toString());
    });
    sink = emailPushSwitch.valueChanges.listen((event) {
      log(event.toString());
    });
    sink = pushSwitch.valueChanges.listen((event) {
      log(event.toString());
    });

    registerServices();
  }

  registerServices() {
    _loginService = getIt.get<LoginService>();
  }

  // review: get and update all cases

  /// preparation for listview
  /// add functions here
  generateFormView() {
    return [
      ListTileModel(title: translation(context).settingsProfileLabel),
      ListTileModel(
          title: translation(context).settingsProfileEdit,
          subTree: 1,
          icon: Icons.account_box,
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditProfileView(user: MockData.MOCK_USER),
              ))),
      ListTileModel(
          title: translation(context).resetPassword,
          subTree: 1,
          icon: Icons.password,
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.of(context)
              .pushNamed(RouterGenerator.resetPasswordView)),
      ListTileModel(title: translation(context).settingsPreferencesLabel),
      ListTileModel(
          title: translation(context).settingsLanguage,
          subTree: 1,
          icon: Icons.language,
          trailing: const Icon(Icons.arrow_forward_ios)),
      ListTileModel(
          subTree: 1,
          title: translation(context).settingsThemeMode,
          icon: Icons.mode_night_outlined,
          trailing: ReactiveSwitch(formControl: themeModeSwitch)),
      ListTileModel(
          title: translation(context).emailPush,
          subTree: 1,
          icon: Icons.attach_email_outlined,
          trailing: ReactiveSwitch(formControl: emailPushSwitch)),
      ListTileModel(
          title: translation(context).push,
          subTree: 1,
          icon: Icons.push_pin,
          trailing: ReactiveSwitch(formControl: pushSwitch))
    ];
  }
}
