import 'package:alpin_frontend/components/overview/overview_model.dart';
import 'package:alpin_frontend/config.dart';
import 'package:alpin_frontend/model/widget/drawer_widget.dart';
import 'package:alpin_frontend/routing.dart';
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
          );
        },
      );
}
