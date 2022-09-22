import 'package:alpin_frontend/utilities/subsink.dart';
import 'package:get_it/get_it.dart';

class DisposableState implements Disposable{
  SubSink sink = SubSink();



  @override
  void onDispose() {
    
    sink.unsubscribe();
  }
}