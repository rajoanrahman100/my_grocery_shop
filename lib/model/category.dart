import 'package:flutter/material.dart';

class Category{
  String? name;
  String? icon;
  Color? color;
  String? imageName;
  List<SubCategory> subCategory;

  Category({this.name,this.icon,this.color,this.imageName,required this.subCategory});

}


class SubCategory{
  String? name;
  String? icon;
  Color? color;
  String? imageName;
  //List<Category?> subCategory;

  SubCategory({this.name,this.icon,this.color,this.imageName});

}