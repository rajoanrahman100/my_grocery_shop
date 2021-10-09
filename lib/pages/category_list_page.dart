import 'package:flutter/material.dart';
import 'package:my_grocery_shop/helper/appcolors.dart';
import 'package:my_grocery_shop/helper/constants.dart';
import 'package:my_grocery_shop/helper/icon_hepler.dart';
import 'package:my_grocery_shop/helper/utils.dart';
import 'package:my_grocery_shop/model/category.dart';
import 'package:my_grocery_shop/widgets/category_icon.dart';
import 'package:my_grocery_shop/widgets/categoty_bottom_bar.dart';
import 'package:my_grocery_shop/widgets/icon_font.dart';

class CategoryListPage extends StatelessWidget {
  List<Category> categoryList = Utils.getListOfCategory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: IconFont(
            iconSize: 30,
            iconName: IconFontHelper.LOGO,
            color: AppColors.MAIN_COLOR,
          ),
          iconTheme: IconThemeData(color: AppColors.MAIN_COLOR),
          actions: const [
            Icon(
              Icons.filter_alt_outlined,
              color: AppColors.MAIN_COLOR,
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Select Category",
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: (){
                          debugPrint("index $index");
                        },
                        child: Container(
                          height: 150,
                          margin: const EdgeInsets.all(20),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "assets/imgs/" + categoryList[index].imageName! + '.png',
                                  fit: BoxFit.cover,
                                ),
                              )),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [Colors.black.withOpacity(0.7), Colors.transparent]),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0))),
                                  child: Row(
                                    children: [
                                      //Make the widget circular
                                      CategoryIcons(
                                        color: categoryList[index].color!,
                                        iconName: categoryList[index].icon!,
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        categoryList[index].name!,
                                        style: const TextStyle(color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 25),
                                      )
                                    ],
                                  ),
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.all(10.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: categoryList.length,
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CategoryBottomBar(),
            )
          ],
        ));
  }
}

