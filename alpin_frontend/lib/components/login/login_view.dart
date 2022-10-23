import 'package:alpin_frontend/assets/Theme_Alpin.dart';
import 'package:alpin_frontend/components/login/login_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  final Map<double, Color> _fade = {
    0.4: ThemeAlpin.light().colorScheme.primary,
    0.7: ThemeAlpin.light().colorScheme.primary.withOpacity(0.5),
    1: ThemeAlpin.light().scaffoldBackgroundColor.withOpacity(0.0)
  };
  final String _logoName = "lib/assets/images/logo.png";
  final String _pathNewAccount = 'signin';
  final String _pathForgetPassword = 'resetPassword';

  LoginView({Key? key}) : super(key: key);

  //#region build image view
  buildImage(Size size) => Container(
        /*width: size.width,*/
        height: size.height * 0.5,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(45), topLeft: Radius.circular(45)),
            gradient: LinearGradient(
                colors: _fade.values.toList(),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: _fade.keys.toList()),
            image: DecorationImage(image: AssetImage(_logoName))),
      );
  //#endregion

  @override
  Widget build(BuildContext context) => ViewModelBuilder<LoginModel>.reactive(
        viewModelBuilder: () => LoginModel(context),
        builder: (context, model, child) {
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            body: Column(
              // padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                buildImage(size),
                SizedBox(
                    width: size.width,
                    child: Text(translation(context).title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: ReactiveForm(
                    formGroup: model.settingsForm,
                    child: Column(
                      children: [
                        ReactiveTextField(
                          formControlName: 'email',
                          validationMessages: {
                            'required': (error) =>
                                translation(context).incorrectEmail,
                            'email': (error) =>
                                translation(context).incorrectEmail
                          },
                          decoration: InputDecoration(
                              hintText: translation(context).email,
                              prefixIcon: const Icon(Icons.email)),
                        ),
                        ReactiveTextField(
                          formControlName: 'password',
                          validationMessages: {
                            'required': (error) =>
                                translation(context).incorrectPassword,
                            'minLength': (error) =>
                                translation(context).toShortPassword
                          },
                          decoration: InputDecoration(
                            hintText: translation(context).password,
                            prefixIcon: const Icon(Icons.password),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () => model.pushRoute(_pathForgetPassword),
                              child: Text(translation(context).passwordForget)),
                        ),
                        SizedBox(
                          width: size.width,
                          child: ElevatedButton(
                              onPressed: !model.isFormChecked
                                  ? null
                                  : () => model.save(),
                              child:
                                  Text(translation(context).signInButtonLocal)),
                        ),
                        TextButton(
                            onPressed: () => model.pushRoute(_pathNewAccount),
                            child:
                                Text(translation(context).signUpIfNoAccount)),
                        const Divider(thickness: 2),
                        ElevatedButton( // todo not Implemented yet add // add own google color
                            onPressed: () async {
                              throw ("Halllo");
                              return await showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                    title: Text("not Implemented yet")),
                              );
                            },
                            child: const Text("Google SignIn")),
                        TextButton(
                            onPressed: null,
                            child:
                                Text(translation(context).continueWithoutLogin))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
