import 'package:flutter/material.dart';
import 'package:my_grocery_shop/model/subcategory.dart';

class Category{
  String? name;
  String? icon;
  Color? color;
  String? imageName;
  List<SubCategory> subCategory;

  Category({this.name,this.icon,this.color,this.imageName,required this.subCategory});

}


