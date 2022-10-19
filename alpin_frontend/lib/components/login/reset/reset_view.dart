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
      viewModelBuilder: () => ResetPasswordModel(context),
      builder: (context, model, child) {
        Size size = MediaQuery.of(context).size;
        return Scaffold(
          appBar: AppBar(title: Text(translation(context).resetPassword)),
          body: SizedBox.expand(
            child: Column(
              children: [
                FittedBox(
                  child: SizedBox(
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Text(translation(context).resetPasswordFirst,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.start),
                    ),
                  ),
                ),
                Expanded(
                  child: Stepper(
                      currentStep: model.steps,
                      type: StepperType.vertical,
                      onStepContinue: model.onStepContinued,
                      onStepCancel: model.onStepCancel,
                      steps: [
                        Step(
                          title: Text(translation(context).resetPassEnterEmail),
                          content: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: size.width * 0.5,
                                child: ReactiveTextField(
                                  formControl: model.email,
                                  decoration: InputDecoration(
                                      hintText: translation(context).email),
                                  validationMessages: {
                                    ValidationMessage.required: (error) =>
                                        translation(context).incorrectEmail,
                                    ValidationMessage.email: (error) =>
                                        translation(context).incorrectEmail
                                  },
                                ),
                              )),
                        ),
                        Step(
                          title: Text(
                              translation(context).resetPassEnterTwoFactor),
                          content: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                  width: size.width * 0.5,
                                  child: PinCodeTextField(
                                    keyboardType: TextInputType.number,
                                      appContext: context,
                                      length: 4,
                                      onChanged: (value) => {},
                                      validator: (validator) {
                                        if (validator == null) return null;
                                        if (validator.length < 4) return null;
                                        var checkIt = validator?.trim();
                                        if (model.twoFacCode != checkIt)
                                          return translation(context)
                                              .resetPassInvalid('Code');
                                        model.isFacCodeCorrect = true;
                                        return null;
                                      }))),
                        ),
                        Step(
                          title:
                              Text(translation(context).resetPassEnterNewPass),
                          content: Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: size.width * 0.5,
                              child: ReactiveForm(
                                formGroup: model.changePasswordSettings,
                                child: Column(
                                  children: [
                                    ReactiveTextField(
                                      formControlName: 'new',
                                      decoration: InputDecoration(
                                          hintText: translation(context)
                                              .resetPassChangeNew),
                                      validationMessages: {
                                        'required': (error) => translation(
                                                context)
                                            .resetPassInvalid(
                                                translation(context).password),
                                        'minLength': (error) =>
                                            translation(context).toShortPassword
                                      },
                                    ),
                                    ReactiveTextField(
                                      formControlName: 'newConfirmation',
                                      decoration: InputDecoration(
                                          hintText: translation(context)
                                              .resetPassChangeNewConfirmation),
                                      validationMessages: {
                                        'required': (error) => translation(
                                                context)
                                            .resetPassInvalid(
                                                translation(context).password),
                                        'mustMatch': (error) => translation(
                                                context)
                                            .resetPassNotConfirmationCorrect,
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
