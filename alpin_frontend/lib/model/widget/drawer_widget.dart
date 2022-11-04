
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