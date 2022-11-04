
import 'package:alpin_frontend/components/base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SpendBeerModel extends BaseModel {
  final BuildContext _context;
  late FormControl<int> spender;
  final double minSlider = 0;
  final double maxSlider = 50;

  SpendBeerModel(this._context) {
    spender = FormControl(value: 1);

    sink = spender.valueChanges.listen((event) {
      setState();
    });
  }
}