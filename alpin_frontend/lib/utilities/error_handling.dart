
import 'package:catcher/catcher.dart';

/// errorHandling [debugReport] and [releaseReport]
///
/// edit all properties for [debug] and [release]
class ErrorHandling {

  static get getDebugReport {
    CatcherOptions debugOptions = CatcherOptions(SilentReportMode(), [
      ConsoleHandler()
    ]);

    return debugOptions;
  }

  static get getReleaseReport {
    CatcherOptions releaseOptions = CatcherOptions(SilentReportMode(), [
      ConsoleHandler()
    ]);

    return releaseOptions;
  }
}