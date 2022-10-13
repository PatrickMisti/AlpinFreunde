import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/components/login/reset/reset_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordModel>.reactive(
      viewModelBuilder: () => ResetPasswordModel(),
      builder: (context, model, child) {
        Size size = MediaQuery.of(context).size;
        return Scaffold(
          appBar: AppBar(title: Text(translation(context).resetPassword)),
          body: SizedBox.expand(
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Text(translation(context).resetPasswordFirst,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.start),
                  ),
                ),
                Stepper(
                  currentStep: 1,
                    steps: [
                  Step(
                      title: Text(translation(context).resetPassEnterEmail),
                      content: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: size.width * 0.5,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: translation(context).email),
                          ),
                        ),
                      )),
                  Step(
                      title: Text(translation(context).resetPassEnterTwoFactor),
                      content: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: size.width * 0.5,
                          child: PinCodeTextField(
                            appContext: context,
                            length: 4,
                            onChanged: (value) => print(value),
                            validator: (validator) {
                              var checkIt = validator?.trim();
                              if(checkIt!.length < 3) {
                                return translation(context).diis;
                              }

                              return null;
                            },
                          ),
                        )
                      )),
                  Step(
                      title: Text(translation(context).resetPassEnterNewPass),
                      content: Container())
                ])
              ],
            ),
          ),
        );
      },
    );
  }
}
