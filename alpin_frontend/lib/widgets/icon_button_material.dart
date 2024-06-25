import 'package:flutter/material.dart';

class IconButtonMaterial extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final bool isActive;
  final double padding;

  const IconButtonMaterial(
      {Key? key,
      required this.onTap,
      required this.icon,
      this.isActive = false,
      this.padding = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.tertiary;
    final iconColor = Theme.of(context).iconTheme.color;
    return IconButton(
      onPressed: () => onTap(),
      icon: Icon(icon),
      splashRadius: 18,
      hoverColor: Colors.transparent,
      color: isActive
      ? primaryColor
      : iconColor,
    );
  }
}
