import 'package:alpin_frontend/components/login/login_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  final List<Color> fadeColor = [
    Colors.orange,
    Colors.orange.withOpacity(0.5),
    Colors.orange.withOpacity(0)
  ];
  final List<double> fadeNumber = [0.6, 0.8, 1];
  final String logoName = "lib/assets/images/logo.png";

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ViewModelBuilder<LoginModel>.reactive(
      viewModelBuilder: () => LoginModel(),
      builder: (context, model, child) {
        Size size = MediaQuery.of(context).size;
        return Scaffold(
            body: SizedBox(
                height: size.height,
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
                                      colors: fadeColor,
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: fadeNumber),
                                  image: DecorationImage(
                                      image: AssetImage(logoName))),
                            ))),
                    Positioned(
                        top: size.height * 0.5,
                        width: size.width,
                        child: Text(translation(context).title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold))),
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
                                  child: Text(
                                      translation(context).loginSwipeLeft)),
                              const Spacer(flex: 4),
                              Flexible(
                                  child: Text(
                                      translation(context).loginSwipeRight))
                            ],
                          ),
                        ))
                  ],
                )));
      });
}
