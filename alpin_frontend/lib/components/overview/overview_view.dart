
import 'package:alpin_frontend/components/overview/overview_model.dart';
import 'package:alpin_frontend/config.dart';
import 'package:alpin_frontend/model/widget/navigation_widget.dart';
import 'package:alpin_frontend/routing.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OverviewView extends StatelessWidget {
  const OverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<OverviewModel>.reactive(
        viewModelBuilder: () => OverviewModel(context),
        builder: (context, model, child) {
          return Scaffold(
            drawer: DrawerWidget(
                content: Config.drawerConfig(context),
                actualRoute: RouterGenerator.overviewView),
            appBar: AppBar(
              title: Text(translation(context).appointments),
            ),
            body: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [],
            ),
            bottomNavigationBar: BottomNavigationWidget(
              index: model.naviIndex,
              content: Config.bottomNaviConfig,
              onTapFunc: model.changeIndexNavi,
            ),
          );
        },
      );
}
