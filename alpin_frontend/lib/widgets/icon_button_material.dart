
import 'package:alpin_frontend/assets/Theme_Alpin.dart';
import 'package:flutter/material.dart';


class IconButtonMaterial extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final bool isActive;
  final double padding;
  const IconButtonMaterial({Key? key,required this.onTap,required this.icon, this.isActive = false, this.padding = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: InkWell(
        onTap: () => onTap(),
        child: CircleAvatar(
            child: Icon(icon),
            /*foregroundColor: isActive
                ? Colors.white
                : primaryColor,*/
            backgroundColor: isActive
                ? primaryColor
                : Colors.transparent),
      ),
    );
  }
}
