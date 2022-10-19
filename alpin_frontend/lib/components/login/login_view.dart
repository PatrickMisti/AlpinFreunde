import 'package:alpin_frontend/assets/Theme_Alpin.dart';
import 'package:alpin_frontend/components/login/login_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  final List<double> _fadeNumber = [0.4, 0.7, 1];
  final String _logoName = "lib/assets/images/logo.png";
  late final LoginModel _model;

  LoginView({Key? key}) : super(key: key);

  swipeToForward(BuildContext context, DragUpdateDetails? details) {
    if (details == null) return;
    // swipe left direction
    if (details.delta.dx < 0) {
      return Navigator.pushNamed(context, "/overview");
    }
    // swipe right direction
    return showDialog(
      context: context,

      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(20),
          title: Text(translation(context).signIn),
          children: [
            ReactiveForm(
              formGroup: _model.settingsForm,
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
                         /*const OutlineInputBorder(borderSide: BorderSide(width: 5)),*/
                          hintText: translation(context).email)),
                  ReactiveTextField(
                    formControlName: 'password',
                    validationMessages: {
                      'required': (error) =>
                      translation(context).incorrectPassword,
                      'minLength': (error) =>
                      translation(context).toShortPassword
                    },
                    decoration: InputDecoration(
                        hintText: translation(context).password),
                  ),
                  TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/resetPassword'),
                      child: Text(translation(context).passwordForget)),
                  ReactiveValueListenableBuilder<bool>(
                    formControlName: 'submit',
                    builder: (context, value, child) {
                      return ElevatedButton(
                          onPressed:
                              !value.value! ? null : () => print("object"),
                          child: Text(translation(context).signInButtonLocal));
                    },
                  ),
                  TextButton(onPressed: () => Navigator.of(context).pushNamed("/signin"),
                      child: Text(translation(context).signUpIfNoAccount))
                ],
              ),
            ),
          ],
        );
      },
    ).then((value) => _model.settingsForm.reset());
  }

  @override
  Widget build(BuildContext context) => ViewModelBuilder<LoginModel>.reactive(
        viewModelBuilder: () => LoginModel(),
        builder: (context, model, child) {
          Size size = MediaQuery.of(context).size;
          _model = model;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox.expand(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanUpdate: (details) => swipeToForward(context, details),
                child: Stack(
                  children: [
                    Positioned(
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: size.width,
                              height: size.height * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(45),
                                      topLeft: Radius.circular(45)),
                                  gradient: LinearGradient(
                                      colors: [
                                        ThemeAlpin.light().colorScheme.primary,
                                        ThemeAlpin.light().colorScheme.primary.withOpacity(0.5),
                                        ThemeAlpin.light().scaffoldBackgroundColor.withOpacity(0.0)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: _fadeNumber),
                                  image: DecorationImage(
                                      image: AssetImage(_logoName))),
                            ))),
                    Positioned(
                        top: size.height * 0.55,
                        width: size.width,
                        child: Text(translation(context).title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))),
                    Positioned(
                        bottom: 40,
                        width: size.width,
                        child: Column(children: [
                          Text(translation(context).loginLetsStart,
                              style: const TextStyle(fontSize: 24)),
                          const Icon(Icons.swipe, size: 40)
                        ])),
                    Positioned(
                      bottom: 15,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child:
                                    Text(translation(context).loginSwipeLeft)),
                            const Spacer(flex: 4),
                            Flexible(
                                child:
                                    Text(translation(context).loginSwipeRight))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
