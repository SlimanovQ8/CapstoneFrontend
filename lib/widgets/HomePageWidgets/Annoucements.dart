import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tbr3at/models/annoucement.dart';
import 'package:tbr3at/providers/announcement_provider.dart';
import '../../Pages/HomePage.dart';

class Announcement extends StatefulWidget {
   int id;
   Announcement({Key? key,
    required this.id
  }) : super(key: key);

  @override
  _AnnouncementState createState() => _AnnouncementState();
}
int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}
class _AnnouncementState extends State<Announcement> {
  @override
  List <Annoucement> announcement = [];
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 4,

      child: Container(
        margin: EdgeInsets.only(top: 10),
        child:     FutureBuilder(
          future: Provider.of<AnnouncementProvider>(context, listen: false).getAnnoouncements(),
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                print(dataSnapshot.error);

                return const Center(
                  child: Text('There are no Announcements', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                );
              } else {
                widget.id == 0 ? announcement = context.read<AnnouncementProvider>().announcement.toList() : announcement = context.read<AnnouncementProvider>().announcement.where((element) => element.category_name!.id == widget.id).toList();
                 return Container(
                    margin: EdgeInsets.only(top: 20),
                    child:  ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      itemCount: announcement.length,
                      itemBuilder: (context, index) {
                        print("${widget.id}  ${announcement[index].category_name!.name!}");
                        final annoucementEndDate = DateTime.parse(announcement[index].duration!);
                        final Date = DateTime.now();

                        int quantity = announcement[index].quantity!;
                        int remaining = announcement[index].remaining!;
                        double Remaining = (quantity - remaining) / quantity;
                        print(Remaining);
                        final remainingDays = daysBetween(Date, annoucementEndDate);

                        return GestureDetector(
                          onTap: () {
                            context.push("/detailpage", extra: announcement[index]);
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
                                            image: NetworkImage(
                                                announcement[index].image!),
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
                                          announcement[index].name!,
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
                                          animationDuration: 1500,
                                          percent: Remaining,
                                          center: Text("${double.parse((Remaining.toDouble() * 100).toStringAsFixed(1))}%"),
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
                                                announcement[index].charity_name!.name!,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),

                                            Container(
                                             child: Icon(Icons.announcement,
                                               color:
                                               announcement[index].priority == "High" ? Colors.red :
                                               announcement[index].priority == "Medium" ? Colors.orange :
                                                   Colors.green
                                             ),

                                            ),
                                            Container(
                                              child: Text(
                                                " ${remainingDays} Days Left",
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

                );
              }
            }
          },
        ),


      ),
    );
  }
}
