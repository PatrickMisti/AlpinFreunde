import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/model/trip_suggestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

/// [_contentWidgets] is the content from the card
///
/// [Card] widget is only the style for the list
class SuggestionWidget extends StatelessWidget {
  final TripSuggestion suggestion;
  final bool isAdmin;
  final Function deleteById;
  final Function editSuggestion;

  const SuggestionWidget(
      {Key? key,
      required this.suggestion,
      required this.isAdmin,
      required this.deleteById,
      required this.editSuggestion})
      : super(key: key);

  final titleTextStyle = const TextStyle(color: Colors.white, fontSize: 20);
  final contentTextStyle = const TextStyle(color: Colors.black);

  ReactiveForm _contentWidgets(
      {required BuildContext context,
      required String name,
      required String date,
      required Size size,
      required SuggestionWidgetModel model}) {
    return ReactiveForm(
        formGroup: model.setting,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: titleTextStyle),
                  Row(
                    children: [
                      if (isAdmin)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          child: GestureDetector(
                            child: Icon(Icons.delete,
                                size: titleTextStyle.fontSize,
                                color: titleTextStyle.color),
                          ),
                        ),
                      if (isAdmin)
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            child: GestureDetector(
                              onTap: model.edit,
                              child: Icon(Icons.edit,
                                  size: titleTextStyle.fontSize,
                                  color: titleTextStyle.color),
                            )),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: GestureDetector(
                          child: Icon(Icons.link,
                              size: titleTextStyle.fontSize,
                              color: titleTextStyle.color),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: !model.isEdit
                  ? Text(
                      model.setting.control('title').value,
                      style:
                          TextStyle(fontSize: (titleTextStyle.fontSize! - 2)),
                    )
                  : ReactiveTextField(formControlName: 'title'),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 5),
              child: !model.isEdit
                  ? RichText(
                      text: TextSpan(
                          text: model.setting.control('text').value,
                          style: contentTextStyle))
                  : ReactiveTextField(
                      formControlName: 'text',
                      minLines: 1,
                      maxLines: 10,
                    ),
            ),
            Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                width: size.width,
                child: Text(date, style: const TextStyle(fontSize: 12)))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String name =
        [suggestion.user.firstName, suggestion.user.lastName].join(' ');
    String date = DateFormat.yMd('de').format(suggestion.time).toString();
    return ViewModelBuilder<SuggestionWidgetModel>.reactive(
      viewModelBuilder: () =>
          SuggestionWidgetModel(isAdmin, suggestion, editSuggestion, context),
      builder: (context, model, child) {
        return Card(
          elevation: 10,
          shadowColor: Colors.black,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))),
          margin: const EdgeInsets.all(10),
          child: _contentWidgets(
              context: context,
              name: name,
              date: date,
              size: size,
              model: model),
        );
      },
    );
  }
}

class SuggestionWidgetModel extends BaseModel {
  final bool isAdmin;
  bool isEdit = false;
  final TripSuggestion _trip;
  late FormGroup setting;
  final Function editSuggestion;

  SuggestionWidgetModel(this.isAdmin, this._trip, this.editSuggestion, BuildContext context) : super(context) {
    setting = FormGroup({
      'title': FormControl<String>(
          value: _trip.title, validators: [Validators.required]),
      'text': FormControl<String>(
          value: _trip.description, validators: [Validators.required])
    });
  }

  edit() {
    if (isEdit && setting.dirty && setting.valid) editSuggestion(setting.rawValue);
    isEdit = !isEdit;
    setState();
  }
}
