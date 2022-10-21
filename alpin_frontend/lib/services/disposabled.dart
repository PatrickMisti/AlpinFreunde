import 'dart:async';

import 'package:alpin_frontend/utilities/subsink.dart';

class DisposableState {
  final SubSink _sink = SubSink();

  // get sink => _sink;

  set sink(StreamSubscription value) => _sink.sink = value;

  void onDispose() {
    _sink.unsubscribe();
  }
}