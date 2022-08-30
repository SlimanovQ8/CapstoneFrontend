import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tbr3at/widgets/DetailPageWidgets/bottomNavBarWidget.dart';

import '../constants/constants.dart';
import '../widgets/DetailPageWidgets/ImageFlipperWidget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        elevation: 0,
        title: Text("Detail", style: TextStyle(
          color: Colors.black
        ),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  ImageFlipper(),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.all(10),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom:8),
                          child: Text("Campaign Name", style: TextStyle(
                              fontSize: 20
                          ),),
                        ),
                        Container(
                          child: Text(
                            "5 Days Left",
                            //overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 16,
                              color: AppButtons,

                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.all(10),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom:8),
                          child: Text("Description", style: TextStyle(
                              fontSize: 20
                          ),),
                        ),
                        Container(
                          child: Text(
                            "We Know what happend in Palestine. Many Casualities and a lot of infrastructure was destroyed by the Israeli army. But not many know about this fact...",
                            //overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,

                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(

                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Card(

                      shape: RoundedRectangleBorder(
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            padding: EdgeInsets.only(left: 20, bottom: 10),
                            alignment: Alignment.center,
                            child: Row(

                              children: [
                                Text(
                                  'Donation Raised ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            child: Row(
                              children: [
                                LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width - 70,
                                  animation: true,

                                  lineHeight: 7.0,
                                  trailing: Text("70%"),
                                  animationDuration: 4000,
                                  percent: 0.7,
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Color(0xff24a6b4),
                                ),

                              ],
                            ),


                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                            alignment: Alignment.center,
                            child: Row(

                              children: [
                                Text(
                                  '3500/5000 KD',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom:8),
                          child: Text("Organized By", style: TextStyle(
                              fontSize: 20
                          ),),
                        ),
                        Card(
                          elevation: 0.0,
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white),
                            child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.only(right: 12.0),
                                // decoration: new BoxDecoration(
                                //     border: new Border(
                                //         right: new BorderSide(
                                //             width: 1.0, color: Colors.black))),
                                child:  Container(
                                  //padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                  child:   ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      'assets/images/al3oonb.jpg',
                                      width: 65,
                                      height: 65,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text("Aloun Charity"
                              ),
                              subtitle: Text( "Verified Organizer", style: TextStyle(color: AppButtons),
                              ),

                              onTap: () {

                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),



                ],
              )),
        ],
      ),

  bottomNavigationBar: BottomNavBar(),


    );
  }
}
