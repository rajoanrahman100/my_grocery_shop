import 'dart:ui';

class SubCategory{
  String? name;
  String? icon;
  Color? color;
  String? imageName;
  List<CategoryParts?> categoryParts;

  SubCategory({this.name,this.icon,this.color,this.imageName,required this.categoryParts});

}


class CategoryParts{
  String? name;
  String? image;
  bool? isSelected=false;

  CategoryParts({this.name,this.isSelected,this.image});
}