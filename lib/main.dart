import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tbr3at/models/annoucement.dart';
import 'package:tbr3at/pages/DetailPage.dart';
import 'package:tbr3at/pages/HomePage.dart';
import 'package:tbr3at/pages/ItemDonate.dart';
import 'package:tbr3at/pages/LoginPage.dart';
import 'package:tbr3at/pages/SignUpPage.dart';
import 'package:tbr3at/providers/announcement_provider.dart';
import 'package:tbr3at/providers/category_provider.dart';
import 'package:tbr3at/providers/item_provider.dart';
import 'providers/auth_provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<AnnouncementProvider>(create: (_) => AnnouncementProvider()),
        ChangeNotifierProvider<ItemProvider>(create: (_) => ItemProvider()),
        ChangeNotifierProvider<CategoryProvider>(create: (_) => CategoryProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,

    );
  }

  //AuthProvider ap = AuthProvider();
  final _router =
  GoRouter(initialLocation: 1 == 2 ? "/signin" : "/homepage", routes: [
    GoRoute(path: "/", builder: (context, state) => SignUpPage()),
    GoRoute(path: "/signin", builder: (context, state) => LoginPage()),
    GoRoute(path: "/homepage", builder: (context, state) => HomePage()),
    GoRoute(path: "/itemDonate", builder: (context, state) => ItemDonate(CategoryName: state.extra as List <String>,)),
    GoRoute(path: "/detailpage", builder: (context, state) => DetailPage(annoucement: state.extra as Annoucement,)),

  ]);
}

