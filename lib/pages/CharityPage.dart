import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tbr3at/widgets/HomePageWidgets/CharitNavBar.dart';

import '../widgets/HomePageWidgets/BottomNavBar.dart';

class CharityPage extends StatelessWidget {
  const CharityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 194, 194, 194),
        appBar: AppBar(
          title: const Text(
            "Tbr3at",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xfff5f5fd),
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
          /* create drawer with logout */
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                //add image of the charity in drawer header_bar

                child: Text('Charity name'),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
              ListTile(
                title: Text('Setting'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Text('Charity Page',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Container(
                  width: 350,
                  height: 200,
                  margin: EdgeInsets.only(top: 20),
                  child: Card(
                    //color white
                    elevation: 55,
                    color: Color.fromARGB(255, 160, 231, 144),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Add Your Donation Adds Here.',
                                  textScaleFactor: 1.2,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 25),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Text(
                                        'Use the  (+)  sign in the bottom to add ',
                                        textScaleFactor: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                  'donation for the users to donate.',
                                  textScaleFactor: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CharityBar(),
      ),
    );
  }
}
