import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/config.dart';
import 'package:flutter/widgets.dart';

class OverviewModel extends BaseModel {
  final List<Widget> screens = Config.overlayScreens;
  OverviewModel(BuildContext _context) : super(_context) {}


}
