import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tbr3at/models/annoucement.dart';
import 'package:tbr3at/pages/CreateAnnouncement.dart';
import 'package:tbr3at/providers/category_provider.dart';
import 'package:tbr3at/services/annoucement_services.dart';

class AnnouncementProvider extends ChangeNotifier {
  List<Annoucement> announcement = [];
  List<Annoucement> CharityAnnouncements = [];

  bool check = false;
  Future<void> getAnnoouncements() async {
    announcement = await AnnouncementServices().getAnnouncementsServices();
    await CategoryProvider().getAllCategory();
  }

  // Future<void> getUserTrips({required int UserID}) async {
  //   userTrips = await TripsServices().getUserTripsServices(UserID: UserID);
  // }
  // Future<bool?> CreateTrip(String title, String description, File image) async {
  //
  //   check = await TripsServices().CreateTrip(title: title, description: description, image: image);
  //   await getTrips();
  //
  //
  //   notifyListeners();
  //
  //   return check;
  // }
  //
  Future<bool?> Donate(
      {required int amount, required int AnnouncementID, required int DonaterID, required int points, required int numOfDonation}) async {

    check = await AnnouncementServices().Donate(amount: amount, AnnouncementID: AnnouncementID, DonaterID: DonaterID, points: points, numOfDonation: numOfDonation);
    await getAnnoouncements();
    notifyListeners();

    return check;
  }

  Future<bool?> CreateAnnouncement(String name, String description, int category_name, String priority, XFile image, String endDate, int amount) async {

    check = await AnnouncementServices().CreateAnnouncement(name: name, description: description, category_name: category_name, priority: priority, image: image, endDate: endDate, amount: amount);
    await getAnnoouncements();
    notifyListeners();

    return check;
  }
}