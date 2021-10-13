import 'package:flutter/material.dart';
import 'package:my_grocery_shop/helper/appcolors.dart';
import 'package:my_grocery_shop/helper/constants.dart';
import 'package:my_grocery_shop/model/subcategory.dart';
import 'package:my_grocery_shop/widgets/category_icon.dart';

class DetailsPage extends StatefulWidget {
  String? imageName;
  Color? color;
  String? iconName;
  List<CategoryParts>? categoryParts;

  DetailsPage({Key? key, this.imageName, this.color, this.iconName, this.categoryParts}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int amount = 0;
  double price = 10.0;
  double cost = 0.0;

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
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/imgs/" + widget.imageName! + "_desc.png"))),
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
                    decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      children: const [
                        Text(
                          "3",
                          style: TextStyle(color: kWhiteColor, fontSize: 15),
                        ),
                        Icon(
                          Icons.shopping_cart,
                          color: kWhiteColor,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Select Items",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.categoryParts!.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          //Change the state of selected Items
                          setState(() {
                            widget.categoryParts!.forEach((CategoryParts element) {
                              element.isSelected = widget.categoryParts![index] != element;
                            });
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: 140,
                              margin: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                  border: widget.categoryParts![index].isSelected!
                                      ? Border.all(color: widget.color!)
                                      : null,
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/imgs/' + widget.categoryParts![index].image! + '.png'),
                                      fit: BoxFit.cover),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black.withOpacity(0.1), offset: Offset.zero, blurRadius: 10)
                                  ]),
                            ),
                            Text(
                              widget.categoryParts![index].name!,
                              style: TextStyle(color: widget.color),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: kWhiteColor, boxShadow: [
                    BoxShadow(blurRadius: 10, offset: Offset.zero, color: Colors.black.withOpacity(0.1))
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            amount++;
                            cost = amount * price;
                          });
                        },
                        child: const Icon(
                          Icons.add_circle_outline,
                          color: AppColors.MEATS,
                          size: 50,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "$amount",
                              style: TextStyle(fontSize: 40),
                            ),
                            const TextSpan(
                              text: "lbs",
                              style: TextStyle(fontSize: 20),
                            )
                          ])),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (amount == 0) {
                              debugPrint("Can be minus value");
                              return;
                            } else {
                              amount--;
                              cost = amount * price;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.grey,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                          text: "Price ",
                          style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                            text: "\$$price/ lb ",
                            style: const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold))
                      ])),
                      Text("\$$cost",
                          style: const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MaterialButton(
                    onPressed: () {},
                    shape: const StadiumBorder(),
                    height: 55,
                    minWidth: double.infinity,
                    color: const Color(0xFF80C038),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.shopping_cart,
                          color: kWhiteColor,
                        ),
                        Text(
                          "Add to cart",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MaterialButton(
                    onPressed: () {},
                    shape: const StadiumBorder(),
                    height: 55,
                    minWidth: double.infinity,
                    color:  AppColors.DARK_GREEN,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on_rounded,color: kWhiteColor,),
                        Text(
                          "Location",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0,),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
