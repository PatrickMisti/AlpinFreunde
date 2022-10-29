import 'dart:developer';

import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/components/settings/edit_profile/edit_profile_view.dart';
import 'package:alpin_frontend/model/widget/list_tile_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/utilities/mock/MockData.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// get all [services] and setup [user], [translations], [theme] usw
///
/// update all changes to backend
class SettingsModel extends BaseModel {
  final BuildContext _context;
  late FormControl<bool> themeModeSwitch;

  SettingsModel(this._context) {
    themeModeSwitch = FormControl<bool>();

    sink = themeModeSwitch.valueChanges.listen((event) {
      log(event.toString());
    });
  }

  // review: get and update all cases

  /// preparation for listview
  /// add functions here
  generateFormView() {
    return [
      ListTileModel(title: translation(_context).settingsProfileLabel),
      ListTileModel(
        title: translation(_context).settingsProfileEdit,
        subTree: 1,
        icon: Icons.account_box,
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.of(_context).push(MaterialPageRoute(
          builder: (context) => EditProfileView(user: MockData.MOCK_USER),
        )),
      ),
      ListTileModel(title: translation(_context).settingsPreferencesLabel),
      ListTileModel(
          title: translation(_context).settingsLanguage,
          subTree: 1,
          icon: Icons.language,
          trailing: const Icon(Icons.arrow_forward_ios)),
      ListTileModel(
          subTree: 1,
          title: translation(_context).settingsThemeMode,
          icon: Icons.mode_night_outlined,
          trailing: ReactiveSwitch(formControl: themeModeSwitch))
    ];
  }
}
