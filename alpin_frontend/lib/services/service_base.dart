
import 'dart:async';
import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

/// base class for all [services]
///
/// not sure if needed
///
abstract class BaseServices {
  void dispose();
}
///
class BaseService implements BaseServices{
  late GetIt getIt;
  BaseService() {
    getIt = GetIt.instance;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}