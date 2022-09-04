import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'package:image_picker/image_picker.dart';
import 'package:tbr3at/models/annoucement.dart';
import 'package:tbr3at/services/item_services.dart';

import '../models/item.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> items = [];
  List<ItemServices> CharityAnnouncements = [];

  bool check = false;
  Future<void> getAllItems() async {
    items = await ItemServices().getItemServices();
  }

// Future<void> getUserTrips({required int UserID}) async {
//   userTrips = await TripsServices().getUserTripsServices(UserID: UserID);
// }
Future<bool?> CreateItem(String name, String description, int category_name, String condition, XFile image,) async {

  check = await ItemServices().CreateItem(name: name, description: description, category_name: category_name, condition: condition, image: image);
  await getAllItems();


  notifyListeners();

  return check;
}
//
// Future<bool?> UpdateTrip(int TripID, String title, String description, File image) async {
//
//   check = await TripsServices().UpdateTrip(TripID: TripID, title: title, description: description, image: image);
//   await getTrips();
//   notifyListeners();
//
//   return check;
// }
//
Future<bool?> DeleteItem(int ItemID) async {

  check = await ItemServices().DeleteItem(ItemID: ItemID);
  await getAllItems();
  notifyListeners();

  return check;
}
}