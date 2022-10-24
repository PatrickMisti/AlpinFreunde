
import 'dart:async';

import 'package:get_it/get_it.dart';

/// base class for all [services]
///
/// not sure if needed
abstract class BaseService extends Disposable {
  abstract final GetIt getIt;

  @override
  FutureOr<void> onDispose();
}