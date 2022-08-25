import 'package:flutter/material.dart';
import 'package:tbr3at/widgets/HomePageWidgets/BottomNavBar.dart';

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
        backgroundColor: Color(0xfff5f5fd),
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

      bottomNavigationBar: BottomBar(),
    );
  }
}
