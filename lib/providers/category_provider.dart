import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'package:image_picker/image_picker.dart';
import 'package:tbr3at/models/annoucement.dart';
import 'package:tbr3at/services/category_services.dart';
import 'package:tbr3at/services/item_services.dart';

import '../models/item.dart';
import '../models/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  List<CategoryServices> CharityAnnouncements = [];

  bool check = false;

  Future<void> getAllCategory() async {
    categories = await CategoryServices().getCategoriesServices();
  }

  Future<List<Category>> getCategoryNames() async {
    categories = await CategoryServices().getCategoriesServices();
    return categories;
  }
}