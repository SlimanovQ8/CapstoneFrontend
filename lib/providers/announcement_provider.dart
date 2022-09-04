import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:tbr3at/models/annoucement.dart';
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
  //
  // Future<bool?> DeleteTrip(int TripID) async {
  //
  //   check = await TripsServices().DeleteTrip(TripID: TripID);
  //   await getTrips();
  //   notifyListeners();
  //
  //   return check;
  // }
}