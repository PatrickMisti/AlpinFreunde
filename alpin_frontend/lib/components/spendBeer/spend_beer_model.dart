import 'package:alpin_frontend/components/base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SpendBeerModel extends BaseModel {
  late FormControl<int> spender;
  final double minSlider = 0;
  final double maxSlider = 50;

  SpendBeerModel(BuildContext context) : super(context) {
    spender = FormControl(value: 1);

    sink = spender.valueChanges.listen((event) {
      setState();
    });
  }
}
