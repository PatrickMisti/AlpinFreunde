import 'dart:async';

import 'package:alpin_frontend/utilities/subsink.dart';
import 'package:get_it/get_it.dart';

class DisposableState implements Disposable{
  final SubSink _sink = SubSink();

  // get sink => _sink;

  set sink(StreamSubscription value) => _sink.sink = value;

  @override
  void onDispose() {
    
    _sink.unsubscribe();
  }
}