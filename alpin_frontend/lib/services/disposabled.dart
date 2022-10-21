import 'dart:async';

import 'package:alpin_frontend/utilities/subsink.dart';

/// add all state's from the [StreamSubscription]
///
/// most powerful widget is to [dispose] all [StreamSubscription]'s
/// [SubSink] add all subscription's
class DisposableState {
  final SubSink _sink = SubSink();

  // get sink => _sink;

  set sink(StreamSubscription value) => _sink.sink = value;

  void onDispose() {
    _sink.unsubscribe();
  }
}