
import 'package:alpin_frontend/services/service_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class SystemSettingsService extends BaseService {

  late BehaviorSubject<TargetPlatform> _platform;
  late BehaviorSubject<ThemeMode> _theme;


  SystemSettingsService() {
    _platform = BehaviorSubject();
    _theme = BehaviorSubject();
  }

  set setPlatform(TargetPlatform? platform) => _platform.sink.add(platform ?? TargetPlatform.android);

  set setTheme(theme) => _theme.sink.add(theme);

  Stream<TargetPlatform> get platform => _platform.asBroadcastStream();

  TargetPlatform? get currentPlatform => _platform.valueOrNull;

  Stream<ThemeMode> get theme => _theme.asBroadcastStream();


  @override
  void dispose() {
    _platform.close();
    _theme.close();
    super.dispose();
  }
}