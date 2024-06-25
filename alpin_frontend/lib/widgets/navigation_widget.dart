
import 'package:alpin_frontend/assets/Theme_Alpin.dart';
import 'package:alpin_frontend/utilities/enum_label.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final Widget? header;
  final List<Map<String, String>> content;
  final String actualRoute;

  const DrawerWidget({Key? key, this.header, required this.content, required this.actualRoute}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          if (header != null)
            DrawerHeader(child: header),
          for (var item in content)
            ListTile(
              title: Text(item['title'].toString()),
              onTap: item['route']?.compareTo(actualRoute) == 0 ? null : () => Navigator.of(context).pushReplacementNamed(item['route'].toString()),
            )
        ],
      ),
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  final Function onTapFunc;
  final int index;
  final List<MapEntry<IconData,OverviewChildWidgets>> content;
  const BottomNavigationWidget({Key? key, required this.index, required this.content, required this.onTapFunc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 700),
        animationCurve: Curves.easeInOutQuart,
        height: 60,
        onTap: (value) => onTapFunc(value),
        index: index,
        // backgroundColor: ThemeAlpin.light().scaffoldBackgroundColor,
        items: [
          for (var item in content)
            Icon(item.key)
        ]);
  }
}
