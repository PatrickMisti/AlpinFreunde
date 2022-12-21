
import 'dart:async';

import 'package:alpin_frontend/services/disposabled.dart';
import 'package:get_it/get_it.dart';

/// base class for all [services]
///
/// not sure if needed
class BaseService {
  late GetIt getIt;

  BaseService() {
    getIt = GetIt.instance;
  }


}