
import 'package:alpin_frontend/components/home_screen/home_screen_view.dart';
import 'package:alpin_frontend/components/newsfeed/newsfeed_view.dart';
import 'package:alpin_frontend/components/overview/overview_model.dart';
import 'package:alpin_frontend/components/settings/settings_view.dart';
import 'package:alpin_frontend/widgets/customSliverAppBar.dart';
import 'package:alpin_frontend/widgets/icon_button_material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OverviewView extends StatelessWidget {
  const OverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<OverviewModel>.reactive(
        viewModelBuilder: () => OverviewModel(context),
        builder: (context, model, child) {
          final iconButton = Theme.of(context).floatingActionButtonTheme;
          final backgroundColor = Theme.of(context).bottomSheetTheme;
          final color = Theme.of(context).primaryColor;
          return Scaffold(
            /*extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: model.getCurrentWidget is HomeScreenView
                  || model.getCurrentWidget is NewsfeedView
                  ? IconButtonMaterial(icon: Icons.newspaper,isActive: model.switchToNews, onTap: model.changeToNews)
                  : null,
              automaticallyImplyLeading: false,
              title: Text(model.getScreenTitle()),
              actions: [
                if (model.getCurrentWidget is! SettingsView)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CircleAvatar(
                        foregroundImage:
                            AssetImage('lib/assets/images/default-image.png')),
                  )
              ],
            ),*/
            /*body: CustomScrollView(
              slivers: [
                CustomSliverAppBar(title: model.getScreenTitle())
              ],
            ),*/
            body: PageView.builder(
              controller: model.controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: model.changeIndexNavi,
              itemCount: model.screens.length,
              itemBuilder: (context, index) => model.getCurrentWidget as Widget,
            ),
            bottomNavigationBar: CurvedNavigationBar(
              buttonBackgroundColor: iconButton.backgroundColor,
              backgroundColor: backgroundColor.backgroundColor!,
              animationCurve: model.curveAnimation,
              color: color,
              animationDuration: model.durationOfAnimation,
              height: 60,
              onTap: model.controller.jumpToPage,
              index: model.naviIndex,
              items: model.screens.map((e) => Icon(e.key)).toList(),
            ),
          );
        },
      );
}
