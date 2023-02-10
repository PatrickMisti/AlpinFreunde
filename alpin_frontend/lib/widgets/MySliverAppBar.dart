import 'package:flutter/material.dart';

class MyPersistentHeaderDel extends SliverPersistentHeaderDelegate {
  final String title;
  final Widget? leading;
  final List<Widget>? trailing;
  // late Platform

  MyPersistentHeaderDel({required this.title, this.leading, this.trailing});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    debugPrint("appbar $shrinkOffset");
    final statusBar = MediaQuery.of(context).viewPadding.top;
    return Container(
      color: Colors.blue,
      child: Text(title),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return this != oldDelegate;
  }

  @override
  double get maxExtent => 130;

  @override
  double get minExtent => kToolbarHeight;
}
