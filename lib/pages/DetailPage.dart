import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
                  Divider(
                    thickness: 2,
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
                    child: Row(
                      children: [
                        LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 50,
                          animation: true,

                          lineHeight: 23.0,
                          animationDuration: 4000,
                          percent: 0.7,
                          center: Text("70.0%"),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Color(0xff24a6b4),
                        ),

                      ],
                    ),

                  ),


                ],
              )),
        ],
      ),




    );
  }
}
