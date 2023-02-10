import 'package:flutter/widgets.dart';

/// ListTileModel for form with tree structure
///
///
class ListTileModel {
  final String title;
  final IconData? icon;
  final Function()? onTap;
  final Widget? trailing;

  ListTileModel(
      {required this.title,
      this.icon,
      this.onTap,
      this.trailing});
}
