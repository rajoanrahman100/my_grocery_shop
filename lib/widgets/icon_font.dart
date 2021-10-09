import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {
  Color? color;
  String? iconName;
  double? iconSize;

  IconFont({this.color, this.iconName, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      iconName!,
      style: TextStyle(color: color, fontSize: iconSize, fontFamily: 'orilla'),
    );
  }
}