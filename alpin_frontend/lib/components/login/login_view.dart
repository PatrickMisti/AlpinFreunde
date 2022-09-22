import 'package:alpin_frontend/components/login/login_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatelessWidget {

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<LoginModel>(
        model: LoginModel(),
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/logo.png")
              )
            ),
            child: Center(child: Text(AppLocalizations.of(context)!.title),),
          )
        )
    );
  }
}
