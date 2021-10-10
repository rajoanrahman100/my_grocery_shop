import 'package:flutter/material.dart';
import 'package:my_grocery_shop/helper/constants.dart';
import 'package:my_grocery_shop/widgets/icon_font.dart';

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({
    Key? key,
    required this.color,
    required this.iconName,
    this.size,
  }) : super(key: key);

  final Color color;
  final String iconName;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: color,
        padding: const EdgeInsets.all(10.0),
        child: IconFont(
          color: kWhiteColor,
          iconSize:size ?? 30.0,
          iconName: iconName,
        ),
      ),
    );
  }
}
