import 'package:alpin_frontend/components/login/signin/signin_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  final String _logo = "lib/assets/images/logo.png";
  final Set loginList = {
    ['firstName', Icons.portrait],
    ['lastName', Icons.portrait],
    ['email', Icons.email],
    ['password', Icons.password]
  };

  SignInView({Key? key}) : super(key: key);

  getTranslationText(BuildContext context, String text) {
    switch (text) {
      case 'userName':
        return translation(context).username;
      case 'firstName':
        return translation(context).firstName;
      case 'lastName':
        return translation(context).lastName;
      case 'email':
        return translation(context).email;
      case 'password':
        return translation(context).password;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<SignInModel>.reactive(
      viewModelBuilder: () => SignInModel(context),
      builder: (context, model, child) {
        return Scaffold(
          body: ReactiveForm(
            formGroup: model.settingsForm,
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  child: Center(
                    child: Container(
                      child: Image.asset(_logo),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Column(
                    children: [
                      Focus(
                          child: ReactiveTextField(
                            formControlName: 'userName',
                            decoration: InputDecoration(
                                hintText:
                                    getTranslationText(context, 'userName'),
                                prefixIcon: const Icon(Icons.smart_toy)),
                            validationMessages: {
                              'required': (error) => translation(context)
                                  .resetPassInvalid(
                                      getTranslationText(context, 'userName')),
                              'existField': (error) => translation(context)
                                  .alreadyExists(translation(context).username)
                            },
                          ),
                          onFocusChange: (bool hasFocus) =>
                              model.checkFormField('userName', hasFocus)),
                      for (var item in loginList)
                        Focus(
                          child: ReactiveTextField(
                            formControlName: item.first,
                            decoration: InputDecoration(
                                hintText:
                                    getTranslationText(context, item.first),
                                prefixIcon: Icon(item.last)),
                            validationMessages: {
                              'required': (error) => translation(context)
                                  .resetPassInvalid(
                                      getTranslationText(context, item.first)),
                              if (item.first == 'password')
                                'minLength': (error) =>
                                    translation(context).toShortPassword,
                              if (item.first == 'email')
                                'email': (error) =>
                                    translation(context).incorrectEmail,
                              if (item.first == 'email')
                                'existField': (error) => translation(context)
                                    .alreadyExists(translation(context).email)
                            },
                          ),
                          onFocusChange: (bool hasFocus) {
                            if (item.first == 'email')
                              model.checkFormField(item.first, hasFocus);
                          },
                        ),
                      const SizedBox(height: 50),
                      for (var item in {
                        ['emailPush', translation(context).emailPush],
                        ['push', translation(context).push]
                      })
                        ReactiveCheckboxListTile(
                          formControlName: item[0],
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(item[1]),
                        )
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1, vertical: 10),
                  child: OutlinedButton(
                    onPressed: model.isRight ? null : () => model.save(),
                    child: Text(translation(context).save),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
