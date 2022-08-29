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
        height: 80,
        margin: EdgeInsets.symmetric( horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(


                     child: Text("100 KD/ Per day", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                    ),
                Container(


                    child: Text("3000 KD/ Per month", style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),)
                ),
              ],
            ),



            ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 40),
                    primary: AppButtons
                  ),
                  child: Text("Rent"),
                  onPressed: () {},
                )


          ],
        ),
      ),
    );
  }
}
