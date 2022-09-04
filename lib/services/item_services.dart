import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:tbr3at/models/annoucement.dart';
import 'package:dio/dio.dart';
import 'package:tbr3at/models/category.dart';
import 'package:tbr3at/models/item.dart';
import 'package:tbr3at/widgets/HomePageWidgets/Annoucements.dart';

import '../providers/auth_provider.dart';

class ItemServices {
  final Dio _dio = Dio();

  final _baseUrl = 'http://8f22-188-71-240-74.in.ngrok.io';
  final _testURL = 'http://10.0.2.2:8000';

  Future<List<Item>> getItemServices() async {
    List<Item> items = [];

    try {
      Response response = await _dio.get(_testURL + '/item/');
      items =
          (response.data as List).map((item) => Item.fromJson(item)).toList();
      print(items[0].image);
    } on DioError catch (error) {
      print(error);
    }
    return items;
  }

//
// Future<List<Trip>> getUserTripsServices({ required int UserID}) async {
//   List<Trip> trips = [];
//   try {
//     Response response = await _dio.get(_testURL + '/trips-list/${UserID}');
//     trips =
//         (response.data as List).map((trip) => Trip.fromJson(trip)).toList();
//     print(trips[0].image);
//   } on DioError catch (error) {
//     print(error);
//   }
//   return trips;
// }
  Category c = Category(id: 2, name: "food", description: "description",  image: "http://127.0.0.1:8000/media/images/donate.png",);
Future<bool> CreateItem({required String name , required String description, required int category_name, required String condition, required XFile image}) async {
  String token = await AuthProvider().getToken();
  print(token);
  bool check = false;

  try {


    FormData data = FormData.fromMap({
      "name": name,
      "description": description,
      "image": await MultipartFile.fromFile(image.path),
      "condition": condition,
      "category_name": category_name

    });
    _dio.options.headers["Authorization"] = "Bearer ${token}";

    Response response = await _dio.post( _testURL + '/item/create/',

        data: data);
    check = true;



    //token = response.data["token"];
  } on DioError catch (error) {
    print(error);
  }
  return check;
}

// Future<bool> UpdateTrip({ required int TripID,required String title , required String description, required File image}) async {
//   String token = await AuthProvider().getToken();
//   print(token);
//   bool check = false;
//
//   try {
//
//
//     FormData data = FormData.fromMap({
//       "title": title,
//       "description": description,
//
//       "image": await MultipartFile.fromFile(image.path),
//     });
//     _dio.options.headers["Authorization"] = "Bearer ${token}";
//
//     Response response = await _dio.put( _testURL + '/trips/${TripID}/update/',
//
//         data: data);
//     check = true;
//
//
//
//   } on DioError catch (error) {
//     print(error);
//   }
//   return check;
// }
//
Future<bool> DeleteItem({ required int ItemID}) async {
  String token = await AuthProvider().getToken();
  print(token);
  bool check = false;

  try {


    _dio.options.headers["Authorization"] = "Bearer ${token}";

    Response response = await _dio.delete( _testURL + '/item/${ItemID}/delete/');
    check = true;



  } on DioError catch (error) {
    print(error);
  }
  return check;
}

// Future<bool> getUserTrip({ required int UserID}) async {
//   String token = await AuthProvider().getToken();
//   print(token);
//   bool check = false;
//
//   try {
//
//     Response response = await _dio.get(_testURL + '/trips-list/${UserID}/');
//     check = true;
//
//
//
//   } on DioError catch (error) {
//     print(error);
//   }
//   return check;
// }
}

