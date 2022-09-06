import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tbr3at/models/annoucement.dart';
import 'package:tbr3at/models/item.dart';
import 'package:tbr3at/providers/announcement_provider.dart';
import 'package:tbr3at/providers/item_provider.dart';
import '../../Pages/HomePage.dart';

class ITEM extends StatefulWidget {
   int id;
   ITEM({Key? key,
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
class _AnnouncementState extends State<ITEM> {
  @override
  List <Item> items = [];
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 4,

      child: Container(
        margin: EdgeInsets.only(top: 10),
        child:     FutureBuilder(
          future: Provider.of<ItemProvider>(context, listen: false).getAllItems(),
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                print(dataSnapshot.error);

                return const Center(
                  child: Text('There are no items', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                );
              } else {
                widget.id == 0 ? items = context.read<ItemProvider>().items.where(((element) => !element.isReserved!)).toList()
                    : items = context.read<ItemProvider>().items.where((element) => element.category_name!.id == widget.id && !element.isReserved!).toList();
                 return Container(
                    margin: EdgeInsets.only(top: 20),
                    child:  ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        print("${widget.id}  ${items[index].category_name!.name!}");


                        return GestureDetector(
                          onTap: () {
                            context.push("/Itemdetailpage", extra: items[index]);
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
                                                items[index].image!),
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
                                          items[index].name!,
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
                                                items[index].created_by!.username!,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),

                                            // Container(
                                            //  child: Icon(Icons.announcement,
                                            //    color:
                                            //    announcement[index].priority == "High" ? Colors.red :
                                            //    announcement[index].priority == "Medium" ? Colors.orange :
                                            //        Colors.green
                                            //  ),
                                            //
                                            // ),
                                            Container(
                                              child: Text(
                                                items[index].condition!,
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
