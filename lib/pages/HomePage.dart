import 'package:flutter/material.dart';
import 'package:tbr3at/constants/constants.dart';
import 'package:tbr3at/widgets/HomePageWidgets/BottomNavBar.dart';

import '../widgets/HomePageWidgets/Annoucements.dart';
import '../widgets/HomePageWidgets/SearchBar.dart';
import '../widgets/HomePageWidgets/categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xfff5f5fd),

      appBar: AppBar(
        title: Text("Tbr3at", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Color(0xffffffff),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.green.withOpacity(0.5),
                  Colors.greenAccent.withOpacity(0.7),
                  Colors.greenAccent.withOpacity(0.7)
                ]),
          ),
        ),
      ),
      body:  Stack(

        alignment: Alignment.bottomCenter,
        children: [
          Column(

            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                height: 200,
                color: Color(0xfffffff),
                child: Column(
                  children: [
                    SearchBar(),
                    Categories(),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(

                      child: Text(
                        'Lastest Campaigns',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      child: Text(
                        "See All",
                        //overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          fontSize: 16,
                          color: AppButtons,

                        ),
                      ),
                    ),

                  ],

                ),
              ),
              Announcement(),

            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomBar(),
    );
  }
}
