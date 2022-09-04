import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tbr3at/providers/announcement_provider.dart';
import 'package:tbr3at/widgets/HomePageWidgets/Annoucements.dart';

import '../../constants/constants.dart';
import '../../providers/auth_provider.dart';

class BottomNavBar extends StatefulWidget {
  int FullAmount;
  int remaining;
  int AnnouncemtID;
   BottomNavBar({
     Key? key,
     required this.FullAmount,
     required this.remaining,
     required this.AnnouncemtID
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
    return  Consumer<AuthProvider>(
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
                child: Text("Donate Now" ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,

                      context: context,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                      ),
                      builder: (context) {
                        return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setS) {
                              return Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Text(
                                            "How much wanna donate?", style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),)),
                                    ),
                                    Container(

                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.7,
                                      height: 45,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      child: OutlinedButton(
                                        child: Text("${widget.FullAmount / 4} 25%",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black
                                          ),

                                        ),
                                        style: choice1 == true ? ElevatedButton
                                            .styleFrom(
                                          side: BorderSide(color: Color(0xff46bbab)),
                                          primary: AppButtons,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),


                                          ),

                                        ) : OutlinedButton.styleFrom(
                                          side: BorderSide(color: Color(0xff46bbab)),
                                          primary: Color(0xff46bbab),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),


                                          ),

                                        ),
                                        onPressed: () {
                                          setS(() {
                                            choice1 = true;
                                            choice2 = false;
                                            choice3 = false;
                                            amount = (widget.FullAmount / 4).toInt();
                                          });
                                        },
                                      ),
                                    ),
                                    Container(

                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.7,
                                      height: 45,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      child: OutlinedButton(
                                        child: Text("${widget.FullAmount / 2} 50%",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black
                                          ),

                                        ),
                                        style: choice2 ? ElevatedButton.styleFrom(
                                          side: BorderSide(color: Color(0xff46bbab)),
                                          primary: AppButtons,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),


                                          ),

                                        ) : OutlinedButton.styleFrom(
                                          side: BorderSide(color: Color(0xff46bbab)),
                                          primary: Color(0xff46bbab),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),


                                          ),

                                        ),

                                        onPressed: () {
                                          setS(() {
                                            choice1 = false;
                                            choice2 = true;
                                            choice3 = false;
                                            amount = (widget.FullAmount / 2).toInt();

                                          });
                                        },
                                      ),
                                    ),
                                    Container(

                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.7,
                                      height: 45,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      child: OutlinedButton(
                                        child: Text("${widget.FullAmount} 100%",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black
                                          ),

                                        ),
                                        style: choice3 ? ElevatedButton.styleFrom(
                                          side: BorderSide(color: Color(0xff46bbab)),
                                          primary: AppButtons,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),


                                          ),

                                        ) : OutlinedButton.styleFrom(
                                          side: BorderSide(color: Color(0xff46bbab)),
                                          primary: Color(0xff46bbab),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),


                                          ),

                                        ),

                                        onPressed: () {
                                          setS(() {
                                            choice1 = false;
                                            choice2 = false;
                                            choice3 = true;
                                            amount = widget.FullAmount;
                                          });
                                        },
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      child:  Center(
                                        child: Text("OR", style: TextStyle(fontSize: 16),),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom /3),

                                          child: TextFormField(
                                            // validator: (value) {
                                            //   if (isNameEmpty) {
                                            //     print('fgcv');
                                            //     return 'Item name cannot be empty.';
                                            //   }
                                            //   return null;
                                            // },
                                            onTap: () {
                                              setS(() {
                                                choice1 = false;
                                                choice2 = false;
                                                choice3 = false;
                                                print('fhdfdc');
                                              });
                                            },
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp("[0-9]")),
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                amount = int.parse(value);
                                              });
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Enter price manually",
                                              hintStyle: TextStyle(),



                                              fillColor: Colors.white,
                                              filled: true,
                                              labelStyle:
                                              TextStyle(fontSize: 24, color: Colors.black),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                  borderSide: BorderSide.none),
                                            ),

                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(

                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.7,
                                      height: 60,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      child: OutlinedButton(
                                        child: Text("Donate",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black
                                          ),

                                        ),
                                        style: ElevatedButton.styleFrom(
                                          side: BorderSide(color: Color(0xff46bbab)),
                                          primary: AppButtons,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),


                                          ),

                                        ),

                                        onPressed: () {
                                          if (amount > widget.remaining)
                                            setS(() {

                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) =>
                                                      AlertDialog(
                                                        title: Text(
                                                          "Error",
                                                          style: TextStyle(color: Color(0xff46bbab)),
                                                        ),
                                                        content: Text(
                                                          "Cannot donate more than the remaining amount!",
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

                                          else {
                                          setS(() {
                                            int Amount = widget.remaining - amount;
                                            int AnnouncementID = widget.AnnouncemtID;
                                            int DonaterID = authProvider.user.id!;
                                            int points = authProvider.user.points! + amount;
                                            int numOfDonation = authProvider.user.numOfDonation! +1;

                                            Donate(amount: Amount, AnnouncementID: AnnouncementID, DonaterID: DonaterID, points: points, numOfDonation: numOfDonation);

                                          });
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );

                            }
                        );
                      });
                },
              )


            ]
          ),
        ),
      ),
    );

  }
  void Donate({required int amount, required int AnnouncementID, required int DonaterID, required int points, required int numOfDonation}) async {
    await Provider.of<AnnouncementProvider>(context, listen: false).Donate(
        amount: amount,
        AnnouncementID: AnnouncementID,
        DonaterID: DonaterID,
        points: points,
        numOfDonation: numOfDonation);

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
                  "Donate Done Successfully",
                  style: TextStyle(color: Color(0xff46bbab)),
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        context.go("/homePage");
                      });
                    },
                    child: Text(
                      'return to homepage',
                      style: TextStyle(
                          color: Color(0xff46bbab)
                      ),
                    ),
                  ),

                ],
              ));
    });



  }
}
