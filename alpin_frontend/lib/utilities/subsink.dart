
import 'dart:async';

abstract class SubscriptionLike {
  StreamSubscription? sink;
  void unsubscribe();
}
// https://github.com/CN-Tower/subsink2/blob/master/src/subsink.ts
class SubSink {
  late List<StreamSubscription> _sub = <StreamSubscription>[];
  final Map<String, StreamSubscription> _subsPool = {};

  SubSink();

  void add(List<StreamSubscription> sub) {
    _sub.addAll(sub);
  }

  set sink(StreamSubscription value) {
    _sub.add(value);
  }

  id(String subId) {


  }

  void unsubscribe() {
    _sub.map((element) => element.cancel());
    _sub = <StreamSubscription>[];
  }
}