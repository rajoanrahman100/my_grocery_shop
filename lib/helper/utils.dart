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
        subCategory: []
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