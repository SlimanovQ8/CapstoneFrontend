import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddDonation extends StatelessWidget {
  const AddDonation({Key? key}) : super(key: key);

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
          child: Text('Add Donation'),
        ),
      ),
    );
  }
}
