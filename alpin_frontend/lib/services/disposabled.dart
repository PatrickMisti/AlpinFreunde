
import 'dart:developer';

import 'package:alpin_frontend/utilities/subsink.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class Disposabled implements Disposable{
  SubSink sink = SubSink();




  @override
  void onDispose() {
    sink.unsubscribe();
  }
}