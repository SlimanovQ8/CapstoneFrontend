import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tbr3at/pages/HomePage.dart';
import 'package:tbr3at/pages/LoginPage.dart';
import 'package:tbr3at/pages/SignUpPage.dart';
import 'package:tbr3at/pages/CharityPage.dart';
import 'providers/auth_provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );




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
  final _router = GoRouter(initialLocation: 1 == 2 ? "/signin" : "/", routes: [
    GoRoute(path: "/", builder: (context, state) => CharityPage()),
    GoRoute(path: "/signin", builder: (context, state) => LoginPage()),
    GoRoute(path: "/homepage", builder: (context, state) => HomePage()),

  ]);
}
