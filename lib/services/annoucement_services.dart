import 'dart:io';

import 'package:tbr3at/models/annoucement.dart';
import 'package:dio/dio.dart';
import 'package:tbr3at/widgets/HomePageWidgets/Annoucements.dart';

class AnnouncementServices {
  final Dio _dio = Dio();

  final _baseUrl = 'http://8f22-188-71-240-74.in.ngrok.io';
  final _testURL = 'http://10.0.2.2:8000';

  Future<List<Annoucement>> getAnnouncementsServices() async {
    List<Annoucement> announ = [];

    try {
      Response response = await _dio.get(_testURL + '/announcement/');
      announ =
          (response.data as List).map((announcement) => Annoucement.fromJson(announcement)).toList();
      print(announ[0].image);
    } on DioError catch (error) {
      print(error);
    }
    return announ;
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
  // Future<bool> CreateTrip({required String title , required String description, required File image}) async {
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
  //       "usernake": "username",
  //
  //     });
  //     _dio.options.headers["Authorization"] = "Bearer ${token}";
  //
  //     Response response = await _dio.post( _testURL + '/trips/create/',
  //
  //         data: data);
  //     check = true;
  //
  //
  //
  //     //token = response.data["token"];
  //   } on DioError catch (error) {
  //     print(error);
  //   }
  //   return check;
  // }
  //
  Future<bool> Donate({ required int amount, required int AnnouncementID, required int DonaterID, required int points, required int numOfDonation}) async {
    // String token = await AuthProvider().getToken();
    // print(token);
    bool check = false;
    print('adfcv');

    try {


      FormData data = FormData.fromMap({
        "remaining": amount,

     });

      Response response = await _dio.put( _testURL + '/announcement/donate/${AnnouncementID}/',

          data: data);
      check = true;

      print('adfcv');



    } on DioError catch (error) {
      print(error);
    }
    try {


      FormData data = FormData.fromMap({
        "points": points,
        "numOfDonation": numOfDonation,

      });

      Response response = await _dio.put( _testURL + '/users/points/${DonaterID}/',

          data: data);
      check = true;

      print('adfcv');



    } on DioError catch (error) {
      print(error);
    }
    return check;
  }

  // Future<bool> DeleteTrip({ required int TripID}) async {
  //   String token = await AuthProvider().getToken();
  //   print(token);
  //   bool check = false;
  //
  //   try {
  //
  //
  //     _dio.options.headers["Authorization"] = "Bearer ${token}";
  //
  //     Response response = await _dio.delete( _testURL + '/trips/${TripID}/delete/');
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

