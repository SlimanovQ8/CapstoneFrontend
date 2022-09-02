import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:tbr3at/models/annoucement.dart';
import 'package:dio/dio.dart';
import 'package:tbr3at/models/category.dart';
import 'package:tbr3at/models/item.dart';
import 'package:tbr3at/widgets/HomePageWidgets/Annoucements.dart';

import '../providers/auth_provider.dart';

class CategoryServices {
  final Dio _dio = Dio();

  final _baseUrl = 'http://8f22-188-71-240-74.in.ngrok.io';
  final _testURL = 'http://10.0.2.2:8000';

  Future<List<Category>> getCategoriesServices() async {
    List<Category> categories = [];

    try {
      Response response = await _dio.get(_testURL + '/category/');
      categories =
          (response.data as List).map((category) => Category.fromJson(category)).toList();
      print(categories[0].description);
    } on DioError catch (error) {
      print(error);
    }
    return categories;
  }
  }