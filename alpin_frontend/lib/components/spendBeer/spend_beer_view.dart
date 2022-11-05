import 'package:alpin_frontend/components/spendBeer/spend_beer_model.dart';
import 'package:alpin_frontend/config.dart';
import 'package:alpin_frontend/model/widget/navigation_widget.dart';
import 'package:alpin_frontend/routing.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class SpendBeerView extends StatelessWidget {
  final String _beerLogo = 'lib/assets/images/beer.png';

  const SpendBeerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<SpendBeerModel>.reactive(
        viewModelBuilder: () => SpendBeerModel(context),
        builder: (context, model, child) {
          return Scaffold(
            drawer: DrawerWidget(
                content: Config.drawerConfig(context),
                actualRoute: RouterGenerator.spendBeerView),
            appBar: AppBar(
              title: Text(translation(context).spendBeer),
            ),
            body: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Text(
                    translation(context).spendBeerDesc,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Image(
                    image: AssetImage(_beerLogo),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ReactiveSlider(
                    //review when animation of beer onChangedEnd to fill the bottle
                    formControl: model.spender,
                    min: model.minSlider,
                    max: model.maxSlider,
                    divisions: model.maxSlider.toInt(),
                    labelBuilder: (p0) => p0.toInt().toString(),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.amberAccent),
                    onPressed: null,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  '${model.spender.value.toString()} ${translation(context).beer}\t\t\t\t',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(39, 144, 195, 1))),
                          const TextSpan(
                              text: 'Pay',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(39, 52, 106, 1))),
                          const TextSpan(
                              text: 'Pal',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(39, 144, 195, 1)))
                        ],
                      ),
                    ),
                  ),
                )
              ],
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
