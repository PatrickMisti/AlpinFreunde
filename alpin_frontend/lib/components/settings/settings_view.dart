
import 'package:alpin_frontend/components/settings/settings_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  final String _defaultImage = 'lib/assets/images/default-image.png';

  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<SettingsModel>.reactive(
        viewModelBuilder: () => SettingsModel(context),
        builder: (context, model, child) {
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      centerTitle: true,
                      title: Text(translation(context).settings),
                      floating: true,
                      snap: true,
                    ),
                  )
                ];
              },
              body: ListView(
                padding: const EdgeInsets.only(top: 5),
                children: [
                  ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: size.width * .4),
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          width: double.infinity,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(_defaultImage)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: MaterialButton(
                              minWidth: 150,
                              color: Theme.of(context).primaryColor,
                              textColor: Theme.of(context).secondaryHeaderColor,
                              onPressed: () => print('object'),
                              child: Text(
                                  translation(context).changeProfileImage)),
                        ),
                      ])),
                  FormWidgetView(inputForm: model.generateFormView())
                ],
              ),
            ),
          );
        },
      );
}
