import 'package:alpin_frontend/components/base_widget.dart';
import 'package:alpin_frontend/components/newsfeed/newsfeed_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewsfeedView extends StatelessWidget implements BaseWidget{

  @override
  String getAppBarName(context) => translation(context).news;

  const NewsfeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<NewsfeedModel>.reactive(
        viewModelBuilder: () => NewsfeedModel(context),
        builder: (context, model, child) {
          return Center(child: Text("test"),);
        },
      );


}
