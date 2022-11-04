
import 'package:alpin_frontend/components/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddSuggestionModel extends BaseModel{
  final BuildContext _context;
  late FormGroup settings;

  late DateTime firstDate;
  bool isSave = false;

  AddSuggestionModel(this._context){
    settings = FormGroup({
      'title': FormControl<String>(validators: [Validators.required]),
      'link': FormControl<String>(validators: [Validators.required]),
      'date': FormControl<DateTime>(value: DateTime.now(), validators: [Validators.required]),
      'text': FormControl<String>(validators: [Validators.minLength(2), Validators.required])
    });

    firstDate = DateTime(DateTime.now().year - 1);

    sink = settings.valueChanges.listen((event) {
      isSave = settings.valid && settings.dirty;
      setState();
    });
  }

  save() {
    Navigator.of(_context).pop(settings.rawValue);
  }
}