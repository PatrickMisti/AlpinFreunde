
import 'package:alpin_frontend/components/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ViewModelBuilder<SettingsModel>.reactive(
        viewModelBuilder: () => SettingsModel(context),
        builder: (context, model, child) {
          return Scaffold();
        },
      );
}
