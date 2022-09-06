import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tbr3at/models/item.dart';
import 'package:tbr3at/providers/announcement_provider.dart';
import 'package:tbr3at/services/item_services.dart';
import 'package:tbr3at/widgets/HomePageWidgets/Annoucements.dart';

import '../../constants/constants.dart';
import '../../models/user.dart';
import '../../providers/auth_provider.dart';

class BottomNavBar extends StatefulWidget {
  Item item;
   BottomNavBar({
     Key? key,
     required this.item,
   }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override

  bool choice1 = false;
  bool choice2 = false;
  bool choice3 = false;
  int amount = 0;
  Widget build(BuildContext context) {

    return Consumer<AuthProvider>(
        builder: (context, authProvider, child) =>
       FutureBuilder(
        future: Provider.of<AuthProvider>(context, listen: false).getUsers(authProvider.user.id!),

        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {

              print(dataSnapshot.error);

              return const Center(
                child: Text('', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              );
            } else {

              return Consumer<AuthProvider>(

                builder: (context, userProfile, child) =>
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) => Container(
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
                                  child: Text("Reserve" ),
                                  onPressed: () {

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: Text(
                                                "Reserve",
                                                style: TextStyle(color: AppButtons),
                                              ),
                                              content: Text(
                                                "Do you want to reserve this Item?",
                                                style: TextStyle(color: AppButtons),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () async {



                                                    // if (chk!)
                                                    setState(() {
                                                      Navigator.of(context).pop();
                                                    });



                                                  },
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: Colors.grey
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  style: TextButton.styleFrom(primary: Colors.grey),
                                                  onPressed: () {
                                                    Reserve(charity_name: authProvider.user.id!, ItemID: widget.item.id!);
                                                  },
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(color: AppButtons),
                                                  ),
                                                ),
                                              ],
                                            ));
                                  },
                                )


                              ]
                          ),
                        ),
                      ),
                    )

              );
            }
          }
        },
      ),
    );

  }
  bool _isLoading = false;
  void Reserve({required int charity_name, required int ItemID}) async {



    print("j");
    bool? chk1;

    setState(() {
      _isLoading = false;

    });
    chk1 = await ItemServices().ReserveItem(charity_name: charity_name, ItemID: ItemID);
    print(chk1);
    if (chk1)
    {
      setState(() {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: Text(
                    "Thank you!",
                    style: TextStyle(color: Color(0xff46bbab)),
                  ),
                  content: Text(
                    "Item has been reserved Successfully!",
                    style: TextStyle(color: Color(0xff46bbab)),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(
                            color: Color(0xff46bbab)
                        ),
                      ),
                    ),

                  ],
                ));
      });

    }
    else {
      _isLoading = false;
    }



  }
}
