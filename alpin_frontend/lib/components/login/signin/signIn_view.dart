import 'package:alpin_frontend/components/login/signin/signin_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  final String _logo = "lib/assets/images/logo.png";

  const SignInView({Key? key}) : super(key: key);

  // todo bottom overflow maybe scrollview
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<SignInModel>.reactive(
      viewModelBuilder: () => SignInModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: ReactiveForm(
              formGroup: model.settingsForm,
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        child: Image.asset(_logo),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Column(
                          children: [
                            ReactiveTextField(
                              formControlName: 'userName',
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.smart_toy)),
                            ),
                            ReactiveTextField(
                              formControlName: 'firstName',
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.portrait)),
                            ),
                            ReactiveTextField(
                              formControlName: 'lastName',
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.portrait)),
                            ),
                            ReactiveTextField(
                              formControlName: 'password',
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.password)),
                            ),
                            SizedBox(height: 50),
                            ReactiveCheckboxListTile(
                              formControlName: 'emailPush',
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(translation(context).emailPush),
                            ),
                            ReactiveCheckboxListTile(
                              formControlName: 'push',
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(translation(context).push),
                            )
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: size.width * 0.8,
                      child: OutlinedButton(
                          onPressed: model.settingsForm.invalid ? null : () => print('object'),
                          child: Text(translation(context).save)),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
