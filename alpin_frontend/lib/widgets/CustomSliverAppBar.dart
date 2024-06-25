import 'dart:async';

import 'package:alpin_frontend/services/system_settings_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class CustomSliverAppBar extends StatefulWidget {
  final Widget? leading;
  final String title;
  final List<Widget>? tail;
  const CustomSliverAppBar({Key? key, this.leading, required this.title, this.tail}) : super(key: key);

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  GetIt getIt = GetIt.instance;
  TargetPlatform? _platform;
  late SystemSettingsService _service;
  late StreamSubscription? _platformService;

  @override
  void initState() {
    _service = getIt.get<SystemSettingsService>();
    _platformService = _service.platform.listen((event) {
      setState(() {
        _platform = event;
      });
    });
  }

  @override
  void dispose() {
    _platformService?.cancel();
    super.dispose();
  }

  //region build
  headerIOS(BuildContext context) {
    return CupertinoSliverNavigationBar(
      largeTitle: Text(widget.title),
      automaticallyImplyLeading: false,
      // leading: widget.leading,
      // trailing: Column(children: widget.tail!),
      // actions: widget.tail,
      // toolbarHeight: kToolbarHeight,
    );
  }

  headerAndroid(BuildContext context) {
    return SliverAppBar(
      title: Text(widget.title),
      automaticallyImplyLeading: false,
      leading: widget.leading,
      actions: widget.tail,
      toolbarHeight: kToolbarHeight,

    );
  }
  //endregion

  @override
  Widget build(BuildContext context) {
    debugPrint("platform ${_platform == null} && ${_service.currentPlatform}");
    _platform ??= TargetPlatform.android;
    switch(_platform) {
      case TargetPlatform.iOS:
        return headerIOS(context);
      case TargetPlatform.android:
        return headerAndroid(context);
      default: // review make default header
        return headerAndroid(context);
    }
  }
}

