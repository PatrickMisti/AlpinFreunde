import 'package:alpin_frontend/components/suggestion/add_suggestion/add_suggestion_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

/// to add Suggestion to list
/// [_getPicker] delivers button and date
/// [model.firstDate] is first date to choose
class AddSuggestionView extends StatelessWidget {
  const AddSuggestionView({Key? key}) : super(key: key);

  FittedBox _getPicker(ReactiveDatePickerDelegate picker, String date) =>
      FittedBox(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          onPressed: picker.showPicker,
          child: Row(
            children: [
              Text(date),
              IconButton(
                  onPressed: picker.showPicker,
                  icon: const Icon(Icons.calendar_month))
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<AddSuggestionModel>.reactive(
        viewModelBuilder: () => AddSuggestionModel(context),
        builder: (context, model, child) {
          Size size = MediaQuery.of(context).size;
          return Dialog(
            child: ReactiveForm(
              formGroup: model.settings,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      translation(context).addNewTourSuggestion,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ReactiveTextField(
                        formControlName: 'title',
                        decoration: InputDecoration(
                            hintText: translation(context).addTitle),
                        validationMessages: {
                          'required': (error) => translation(context)
                              .resetPassInvalid(translation(context).textTitle)
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: ReactiveTextField(
                                formControlName: 'link',
                                decoration: InputDecoration(
                                    hintText: translation(context).addLink),
                                validationMessages: {
                                  'required': (error) => translation(context)
                                      .resetPassInvalid(
                                          translation(context).link)
                                }),
                          ),
                          const Spacer(),
                          ReactiveDatePicker(
                            formControlName: 'date',
                            builder: (context, picker, child) {
                              final date =
                                  DateFormat.Md('de').format(picker.value!);
                              return _getPicker(picker, date);
                            },
                            firstDate: model.firstDate,
                            lastDate: DateTime.now(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: ReactiveTextField(
                            formControlName: 'text',
                            minLines: 1,
                            maxLines: 12,
                            decoration: InputDecoration(
                                hintText: translation(context).addDescription),
                            validationMessages: {
                          'required': (error) => translation(context)
                              .resetPassInvalid(translation(context).text),
                        })),
                    SizedBox(
                      width: size.width,
                      child: OutlinedButton(
                          onPressed: !model.isSave ? null : model.save,
                          child: Text(translation(context).save)),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
}
