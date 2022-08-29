import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../Pages/HomePage.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  _AnnouncementState createState() => _AnnouncementState();
}
List <bool> isClicked = [false, false, false,];
class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 4,

      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: 10, right: 10, bottom: 15, top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              child: Image(
                                height: 180,
                                width: width,
                                fit: BoxFit.fitWidth,
                                image: AssetImage(
                                    "assets/images/campaign.jfif"),
                              ),
                            ),

                          ],
                        ),
                      ),

                      Container(



                        padding: EdgeInsets.only(left: 8, top: 8),

                        child: Row(
                          children: [
                            Text(
                              'Humanity For Palestine',
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
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 30, top: 20),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(

                                  child: Text(
                                    'KD 3500/5000',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                Container(
                                  child: Text(
                                    "5 Days Left",
                                    //overflow: TextOverflow.ellipsis,

                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffbababa),

                                    ),
                                  ),
                                ),

                              ],

                            ),

                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
