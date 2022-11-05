import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(translation(context).appointments),
          leading: const Icon(Icons.newspaper),
          actions: [
            Container(
              margin: EdgeInsets.all(8),
              child: Icon(Icons.person),
            )
          ],
        ),
        SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200),

            delegate: SliverChildBuilderDelegate((context, index) => null),)
      ],
    );
  }
}
