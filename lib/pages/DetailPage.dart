import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tbr3at/models/annoucement.dart';
import 'package:tbr3at/widgets/DetailPageWidgets/bottomNavBarWidget.dart';
import 'package:tbr3at/widgets/HomePageWidgets/Annoucements.dart';

import '../constants/constants.dart';
import '../widgets/DetailPageWidgets/ImageFlipperWidget.dart';

class DetailPage extends StatefulWidget {
  final Annoucement annoucement;
  const DetailPage({Key? key,
    required this.annoucement,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override

  Widget build(BuildContext context) {
    final annoucementEndDate = DateTime.parse(widget.annoucement.duration!);
    final Date = DateTime.now();

    int quantity = widget.annoucement.quantity!;
    int remaining = widget.annoucement.remaining!;
    double Remaining = (quantity - remaining) / quantity;
    int Full = (quantity - remaining) ;
    print(Remaining);
    final remainingDays = daysBetween(Date, annoucementEndDate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        elevation: 0,
        title: Text(widget.annoucement.name!, style: TextStyle(
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
                  ImageFlipper(annoucement: widget.annoucement),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.all(10),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom:8),
                          child: Text(widget.annoucement.name!, style: TextStyle(
                              fontSize: 20
                          ),),
                        ),
                        Container(
                          child: Text(
                            "${remainingDays} Days Left",

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
                          child: Text(widget.annoucement.description!,
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
                                  width: MediaQuery.of(context).size.width - 90,
                                  animation: true,

                                  lineHeight: 7.0,
                                  trailing: Text("${Remaining * 100} %" ),
                                  animationDuration: 1000,
                                  percent: Remaining,
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
                                  '${Full} / ${widget.annoucement.quantity} ',
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
                                    child: Image.network(
                                      widget.annoucement.charity_name!.image!,

                                      width: 65,
                                      height: 65,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(widget.annoucement.charity_name!.name!
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
