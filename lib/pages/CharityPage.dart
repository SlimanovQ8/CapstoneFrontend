import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/HomePageWidgets/BottomNavBar.dart';

class CharityPage extends StatelessWidget {
  const CharityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5fd),
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
                child: Text('Charity name'),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
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
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(child: Text('Outlined Card')),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
