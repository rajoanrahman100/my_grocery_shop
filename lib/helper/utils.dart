import 'package:my_grocery_shop/helper/appcolors.dart';
import 'package:my_grocery_shop/helper/icon_hepler.dart';
import 'package:my_grocery_shop/model/category.dart';
import 'package:my_grocery_shop/model/onboard_content.dart';
import 'package:my_grocery_shop/model/subcategory.dart';

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
            imageName: 'cat1_2',
            name: "Vaca",
            categoryParts: [
              CategoryParts(
                name: "Jamon",
                image: 'cat1_2_p1',
                isSelected: false
              ),
              CategoryParts(
                  name: "Patas",
                  image: 'cat1_2_p2',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Tocineta",
                  image: 'cat1_2_p3',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Lamo",
                  image: 'cat1_2_p4',
                  isSelected: false
              )
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            icon: IconFontHelper.MEATS,
            imageName: 'cat1_2',
            name: "Vaca",
            categoryParts: [
              CategoryParts(
                  name: "Jamon",
                  image: 'cat1_1_p1',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Patas",
                  image: 'cat1_1_p2',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Tocineta",
                  image: 'cat1_1_p3',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Lamo",
                  image: 'cat1_1_p4',
                  isSelected: false
              )
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            icon: IconFontHelper.MEATS,
            imageName: 'cat1_3',
            name: "Gallina",
            categoryParts: [
              CategoryParts(
                  name: "Jamon",
                  image: 'cat1_1_p1',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Patas",
                  image: 'cat1_1_p2',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Tocineta",
                  image: 'cat1_1_p3',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Lamo",
                  image: 'cat1_1_p4',
                  isSelected: false
              )
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            icon: IconFontHelper.MEATS,
            imageName: 'cat1_4',
            name: "Pavo",
            categoryParts: [
              CategoryParts(
                  name: "Jamon",
                  image: 'cat1_1_p1',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Patas",
                  image: 'cat1_1_p2',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Tocineta",
                  image: 'cat1_1_p3',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Lamo",
                  image: 'cat1_1_p4',
                  isSelected: false
              )
            ],
          ),
          SubCategory(
            color: AppColors.MEATS,
            icon: IconFontHelper.MEATS,
            imageName: 'cat1_5',
            name: "Chivo",
            categoryParts: [
              CategoryParts(
                  name: "Jamon",
                  image: 'cat1_1_p1',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Patas",
                  image: 'cat1_1_p2',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Tocineta",
                  image: 'cat1_1_p3',
                  isSelected: false
              ),
              CategoryParts(
                  name: "Lamo",
                  image: 'cat1_1_p4',
                  isSelected: false
              )
            ],
          ),
        ]
      ),
      Category(
          color: AppColors.FRUITS,
          icon: IconFontHelper.FRUITS,
          imageName: 'cat2',
          name: "Fruits",
          subCategory: [],
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

  static List<OnBoardingContent> getOnBoarding(){
    return [
      OnBoardingContent(
        message: "Fresh Product with a reasonable price",
        img: 'onboard1'
      ),
      OnBoardingContent(
        message: 'Home delivery facilities',
        img: 'onboard2'
      ),
      OnBoardingContent(
          message: "It's just like pick items from garden",
          img: 'onboard3'
      ),
    ];
  }
}