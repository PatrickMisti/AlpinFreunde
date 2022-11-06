import 'package:alpin_frontend/components/settings/edit_profile_image/edit_profile_image_view.dart';
import 'package:alpin_frontend/components/settings/settings_model.dart';
import 'package:alpin_frontend/config.dart';
import 'package:alpin_frontend/widgets/navigation_widget.dart';
import 'package:alpin_frontend/routing.dart';
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
            drawer: DrawerWidget(
                content: Config.drawerConfig(context),
                actualRoute: RouterGenerator.settingsView),
            // review add navigation button
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
                          padding: const EdgeInsets.only(top: 10),
                          child: MaterialButton(
                            minWidth: 150,
                            color: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).secondaryHeaderColor,
                            child:
                                Text(translation(context).changeProfileImage),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  //review: not finished yet
                                  return EditProfileImageView();
                                },
                              );
                            },
                          ),
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
