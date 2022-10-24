import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';

/// errorHandling [debugReport] and [releaseReport]
///
/// edit all properties for [debug] and [release]
class ErrorHandling {
  static get getDebugReport {
    CatcherOptions debugOptions = CatcherOptions(SilentReportMode(), [
      SnackbarHandler(const Duration(seconds: 5),
          behavior: SnackBarBehavior.floating, elevation: 2),
      ConsoleHandler()
    ]);

    return debugOptions;
  }

  /// in [Release] state Snackbar should not pop up
  ///
  /// only crash report should send to backend
  static get getReleaseReport {
    CatcherOptions releaseOptions = CatcherOptions(SilentReportMode(), [
      // todo add server url to get crashlytics
      ConsoleHandler()
    ]);

    return releaseOptions;
  }
}
