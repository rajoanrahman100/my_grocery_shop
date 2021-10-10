import 'package:my_grocery_shop/helper/appcolors.dart';
import 'package:my_grocery_shop/helper/icon_hepler.dart';
import 'package:my_grocery_shop/model/category.dart';

class Utils{

  static List<Category> getListOfCategory(){
    return [
      Category(
        color: AppColors.MEATS,
        icon: IconFontHelper.MEATS,
        imageName: 'cat1',
        name: "Meats",
        subCategory: [
          SubCategory(
            color: AppColors.MEATS,
            icon: IconFontHelper.MEATS,
            imageName: 'cat1_1',
            name: "Cerdo",
          ),
          SubCategory(
            color: AppColors.MEATS,
            icon: IconFontHelper.MEATS,
            imageName: 'cat1_2',
            name: "Vaca",
          ),
          SubCategory(
            color: AppColors.MEATS,
            icon: IconFontHelper.MEATS,
            imageName: 'cat1_3',
            name: "Gallina",
          ),
          SubCategory(
            color: AppColors.MEATS,
            icon: IconFontHelper.MEATS,
            imageName: 'cat1_4',
            name: "Pavo",
          ),
          SubCategory(
            color: AppColors.MEATS,
            icon: IconFontHelper.MEATS,
            imageName: 'cat1_5',
            name: "Chivo",
          ),
        ]
      ),
      Category(
          color: AppColors.FRUITS,
          icon: IconFontHelper.FRUITS,
          imageName: 'cat2',
          name: "Fruits",
          subCategory: []
      ),
      Category(
          color: AppColors.VEGS,
          icon: IconFontHelper.VEGS,
          imageName: 'cat3',
          name: "Vegetables",
          subCategory: []
      ),
      Category(
          color: AppColors.SEEDS,
          icon: IconFontHelper.SEEDS,
          imageName: 'cat4',
          name: "Seeds",
          subCategory: []
      ),
      Category(
          color: AppColors.PASTRIES,
          icon: IconFontHelper.PASTRIES,
          imageName: 'cat5',
          name: "Dulces",
          subCategory: []
      ),
      Category(
          color: AppColors.SPICES,
          icon: IconFontHelper.SPICES,
          imageName: 'cat6',
          name: "Spices",
          subCategory: []
      ),
    ];
  }
}