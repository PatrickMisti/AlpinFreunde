import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordModel>.reactive(
      viewModelBuilder: () => ResetPasswordModel(),
      builder: (context, model, child) {
        Size size = MediaQuery
            .of(context)
            .size;
        return Scaffold(
          appBar: AppBar(title: Text(translation(context).resetPassword)),
          body: SizedBox.expand(
            child: Column(
              children: [
                SizedBox(width: size.width, child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                  child: Text(translation(context).resetPasswordFirst,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.start),
                ),),
                Stepper(steps: [
                  Step(
                      title: Text(translation(context).resetPassEnterEmail),
                      content: Container()),
                  Step(
                      title: Text(translation(context).resetPassEnterTwoFactor),
                      content: Container()),
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

class ResetPasswordModel extends BaseModel {
  late int steps;

  ResetPasswordModel() {
    steps = 0;
  }
}
