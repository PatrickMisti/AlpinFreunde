import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/model/widget/list_tile_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FormWidgetView extends StatelessWidget {
  final List<ListTileModel> inputForm;

  const FormWidgetView({Key? key, required this.inputForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FormWidgetModel>.nonReactive(
      viewModelBuilder: () => FormWidgetModel(context),
      builder: (context, model, child) {
        return ListView.separated(
          padding: const EdgeInsets.only(top: 5),
            separatorBuilder: (context, index) => const Divider(height: .5),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: inputForm.length,
            itemBuilder: (context, index) {
              var element = inputForm[index];
              return ListTile(
                onTap: element.onTap,
                tileColor: element.padding != 0
                    ? Theme.of(context).secondaryHeaderColor
                    : null,
                title: Padding(
                  padding: EdgeInsets.only(left: element.padding),
                  child: Row(
                    children: [
                      if (element.icon != null) Icon(element.icon),
                      Padding(
                          padding: EdgeInsets.only(left: element.subTree * 3),
                          child: Text(element.title, /*style: TextStyle(fontSize: 12),*/))
                    ],
                  ),
                ),
                trailing: element.trailing,
              );
            });
      },
    );
  }
}

class FormWidgetModel extends BaseModel {
  FormWidgetModel(BuildContext context) : super(context) {}
}
