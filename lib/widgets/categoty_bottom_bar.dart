import 'package:flutter/material.dart';
import 'package:my_grocery_shop/helper/constants.dart';

class CategoryBottomBar extends StatelessWidget {
  const CategoryBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.2), offset: Offset.zero)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.favorite, color: kPrimaryColor),
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.shopping_cart, color: kPrimaryColor),
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.pin_drop, color: kPrimaryColor),
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.settings, color: kPrimaryColor),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
