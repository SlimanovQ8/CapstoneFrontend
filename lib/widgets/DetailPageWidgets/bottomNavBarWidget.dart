import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric( vertical: 10, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[




            ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 40),
                    primary: AppButtons
                  ),
                  child: Text("Donate Now"),
                  onPressed: () {},
                )


          ],
        ),
      ),
    );
  }
}
