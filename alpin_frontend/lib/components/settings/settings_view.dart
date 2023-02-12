import 'package:alpin_frontend/components/base_widget.dart';
import 'package:alpin_frontend/components/settings/edit_profile_image/edit_profile_image_view.dart';
import 'package:alpin_frontend/components/settings/settings_model.dart';
import 'package:alpin_frontend/model/widget/list_tile_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/widgets/CustomSliverAppBar.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget implements BaseWidget {
  final String _defaultImage = 'lib/assets/images/default-image.png';

  @override
  String getAppBarName(context) => translation(context).settings;

  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<SettingsModel>.reactive(
        viewModelBuilder: () => SettingsModel(context),
        builder: (context, model, child) {
          Size size = MediaQuery.of(context).size;
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(title: getAppBarName(context)),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image:
                            DecorationImage(image: AssetImage(_defaultImage)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MaterialButton(
                        minWidth: 150,
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).secondaryHeaderColor,
                        child: Text(translation(context).changeProfileImage),
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
                  ],
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                ListTileModel element = (model.generateFormView())[index];
                return Column(
                  children: [
                    ListTile(
                      onTap: element.onTap,
                      title: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(element.icon),
                          ),
                          Flexible(
                            child: Text(
                              element.title,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                      trailing: element.trailing,
                    ),
                    if (index < model.generateFormView().length - 1)
                      const Divider(
                        height: 2,
                      )
                  ],
                );
              }, childCount: model.generateFormView().length))
            ],
          );
        },
      );
}
