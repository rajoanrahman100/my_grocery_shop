import 'package:flutter/material.dart';
import 'package:my_grocery_shop/helper/constants.dart';
import 'package:my_grocery_shop/widgets/category_icon.dart';

class DetailsPage extends StatefulWidget {
  String? imageName;
  Color? color;
  String? iconName;

  DetailsPage({Key? key, this.imageName, this.color, this.iconName}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0)),
            child: Stack(
              children: [
                Container(
                  height: 300,
                  decoration:
                      BoxDecoration(image: DecorationImage(image: AssetImage("assets/imgs/" + widget.imageName! + "_desc.png"))),
                ),
                Positioned.fill(
                    child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black.withOpacity(0.6), Colors.transparent])),
                )),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CategoryIcons(
                          color: widget.color!,
                          iconName: widget.iconName!,
                          size: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              "Chicken Meat",
                              style: TextStyle(color: kWhiteColor, fontSize: 25),
                            ),
                            Text(
                              "\$500 / lb",
                              style: TextStyle(color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 50,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: kPrimaryColor, borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      children: const [
                        Text(
                          "3",
                          style: TextStyle(color: kWhiteColor,fontSize: 15),
                        ),
                        Icon(
                          Icons.shopping_cart,
                          color: kWhiteColor,size: 15,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child:Column(
            children:const [

            ],
          ))
        ],
      ),
    );
  }
}
