import 'package:alpin_frontend/components/spendBeer/spend_beer_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SpendBeerView extends StatelessWidget {
  const SpendBeerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<SpendBeerModel>.reactive(
        viewModelBuilder: () => SpendBeerModel(context),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(),
          );
        },
      );
}
