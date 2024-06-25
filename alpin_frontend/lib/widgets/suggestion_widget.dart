import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/model/trip_suggestion.dart';
import 'package:flutter/material.dart';
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

  final titleTextStyle = const TextStyle(
    color: Colors.white, /*fontSize: 20*/
  );

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.displayMedium!.color!;
    String date = DateFormat.yMd('de').format(DateTime.now()).toString();
    final titleColor = Theme.of(context).colorScheme.tertiary;
    final tertiaryColor = Theme.of(context).colorScheme.primary;
    return ViewModelBuilder<SuggestionWidgetModel>.reactive(
      viewModelBuilder: () =>
          SuggestionWidgetModel(isAdmin, suggestion, editSuggestion, context),
      builder: (context, model, child) {
        return Card(
          elevation: 10,
          shadowColor: Colors.black,
          child: Stack(
            children: [
              ReactiveForm(
                formGroup: model.setting,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: !model.isEdit
                          ? Text(model.setting.control('title').value)
                          : ReactiveTextField(
                          formControlName: 'title',
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: textColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: tertiaryColor)))),
                      subtitle: Text([
                        suggestion.user.firstName,
                        suggestion.user.lastName
                      ].join(' ')),
                      leading: IconButton(
                          onPressed: () => print('link'),
                          icon: const Icon(Icons.link)),
                      trailing: isAdmin
                          ? IconButton(
                          onPressed: model.edit, icon: const Icon(Icons.edit))
                          : null,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      tileColor: titleColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 5),
                      child: !model.isEdit
                          ? RichText(
                          text: TextSpan(
                              text: model.setting.control('text').value,
                              style: TextStyle(color: textColor)))
                          : ReactiveTextField(
                        formControlName: 'text',
                        minLines: 1,
                        maxLines: 10,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.all(2),
                      padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      width: double.infinity,
                      child: Text(date),
                    )
                  ],
                ),
              ),
            ],
          )
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

  SuggestionWidgetModel(
      this.isAdmin, this._trip, this.editSuggestion, BuildContext context)
      : super(context) {
    setting = FormGroup({
      'title': FormControl<String>(
          value: _trip.title, validators: [Validators.required]),
      'text': FormControl<String>(
          value: _trip.description, validators: [Validators.required])
    });
  }

  edit() {
    if (isEdit && setting.dirty && setting.valid)
      editSuggestion(setting.rawValue);
    isEdit = !isEdit;
    setState();
  }

  delete() {}
}
