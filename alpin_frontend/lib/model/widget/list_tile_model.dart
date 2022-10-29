import 'package:flutter/widgets.dart';

/// ListTileModel for form with tree structure
///
/// structure append by [subTree] => 0 -> padding:0px; 1 -> padding:5px;
class ListTileModel {
  final int subTree;
  final String title;
  final IconData? icon;
  final Function()? onTap;
  final Widget? trailing;

  ListTileModel(
      {required this.title,
      this.subTree = 0,
      this.icon,
      this.onTap,
      this.trailing});

  double get padding => subTree * 5;
}
