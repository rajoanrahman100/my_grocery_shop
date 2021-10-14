import 'package:flutter/material.dart';
import 'package:my_grocery_shop/helper/appcolors.dart';
import 'package:my_grocery_shop/helper/icon_hepler.dart';
import 'package:my_grocery_shop/model/subcategory.dart';
import 'package:my_grocery_shop/pages/details_page.dart';
import 'package:my_grocery_shop/widgets/category_icon.dart';
import 'package:my_grocery_shop/widgets/icon_font.dart';

class SelectedCategoryPage extends StatelessWidget {
  List<SubCategory> subCategoryList = [];
  String categoryName;
  Color color;
  String iconName;

  SelectedCategoryPage(
      {Key? key, required this.subCategoryList, required this.categoryName, required this.color, required this.iconName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: IconFont(
          iconSize: 30,
          iconName: IconFontHelper.LOGO,
          color: AppColors.MAIN_COLOR,
        ),
        iconTheme:const IconThemeData(color: AppColors.MAIN_COLOR),
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
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryIcons(
                color: color,
                iconName: iconName,
              ),
              const SizedBox(width: 10),
              Text(
                categoryName,
                style: TextStyle(color: color, fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  subCategoryList.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                    imageName: subCategoryList[index].imageName,
                                    color: subCategoryList[index].color,
                                    iconName: subCategoryList[index].icon,
                                    categoryParts: subCategoryList[index].categoryParts,
                                  )),
                        );
                      },
                      child: Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              "assets/imgs/" + subCategoryList[index].imageName! + '.png',
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Text(
                            subCategoryList[index].name!,
                            style: TextStyle(color: color),
                          )
                        ],
                      ),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
