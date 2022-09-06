// ignore_for_file: unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tbr3at/services/annoucement_services.dart';
import 'package:tbr3at/services/item_services.dart';

import '../../constants/constants.dart';
import '../../models/item.dart';

class OwnerDetail extends StatefulWidget {

  Item OwnDetail;
   OwnerDetail({
     Key? key,
     required this.OwnDetail
   }) : super(key: key);

  @override
  _OwnerDetailState createState() => _OwnerDetailState();
}
List<String> reportList = [
  "Not relevant",
  "Illegal",
  "Spam",
  "Offensive",
];
bool isNameEmpty = false;
bool isDescriptionEmpty = false;
String ReportName = "";
String ReportDescription = "";
List<String> selectedReportList = [];
class _OwnerDetailState extends State<OwnerDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 15,right: 15, bottom: 15),
      width: width,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Row(
            children: [
              Container(
                //padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                child:   ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    widget.OwnDetail.created_by!.image!,
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                //width: 100,
                height: 40,
                  padding: EdgeInsets.only(left: 12),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.OwnDetail.created_by!.username!),
                      Text("Owner")
                    ],
                  )
              ),
            ],
          ),


          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: width/30),

                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  child: Ink(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: secondaryBackground,
                        border: Border.all(
                            color: Colors.transparent,
                            width: 1
                        )
                    ),

                    child: IconButton(
                      icon: Icon(Icons.more_horiz),
                      color: AppButtons,
                      //iconSize: 20,
                      onPressed: () {

                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,

                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(30)),

                            builder: (BuildContext bc){
                              return Container(

                                color: Colors.white,
                                margin: EdgeInsets.all(10),
                                child: new Wrap(

                                  children: <Widget>[
                                    new ListTile(
                                        leading: new Icon(Icons.report),
                                        title: new Text("Report", style: TextStyle(fontSize: 20, color: Colors.red),),
                                        onTap: () => {


                                          Navigator.pop(context),
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                    // backgroundColor: Color (0xff343b4b),
                                                    title: Text("Report  ", style: TextStyle(
                                                        color: Color(0xff5496F4)
                                                    ),),
                                                    actions: [

                                                      Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.black),
                                                          borderRadius: BorderRadius.circular(2),
                                                        ),
                                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                                        child: TextFormField(

                                                          decoration: InputDecoration(
                                                            border: InputBorder.none,
                                                            labelText: "Title"
                                                          ),
                                                          style: TextStyle(color: Colors.black),
                                                          textAlign: TextAlign.left,
                                                          onChanged: (v) {
                                                            ReportName = v;
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),

                                                      Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.black),
                                                          borderRadius: BorderRadius.circular(2),
                                                        ),
                                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                                        child: TextFormField(


                                                          keyboardType: TextInputType.multiline,
                                                          maxLines: 3,

                                                          decoration: InputDecoration(
                                                            border: InputBorder.none,
                                                            labelText: "Description",

                                                          ),
                                                          style: TextStyle(color: Colors.black),
                                                          textAlign: TextAlign.left,
                                                          onChanged: (v) {
                                                            ReportDescription = v;
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),





                                                      Center(
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            if (ReportName == "" || ReportDescription == "")
                                                            {
                                                              setState(() {
                                                                // isEmpty == true;
                                                              });
                                                            }
                                                            else
                                                              setState(() {


                                                                AddReport(name: ReportName, description: ReportDescription, to: widget.OwnDetail.created_by!.id!, ItemID: widget.OwnDetail.id!);
                                                                Navigator.pop(context);
                                                              });
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            primary: AppButtons,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(25),
                                                            ),
                                                            elevation: 15.0,
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(15.0),
                                                            child: Text(
                                                              'Report',
                                                              style: TextStyle(fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                          ),
                                        }
                                    ),

                                  ],
                                ),
                              );
                            }
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(

                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  child: Ink(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: secondaryBackground,
                        border: Border.all(
                            color: Colors.transparent,
                            width: 1
                        )
                    ),
                    child: IconButton(
                      icon: Icon(Icons.call),
                      color: AppButtons,
                      //iconSize: 20,
                      onPressed: () {

                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext bc){
                              return Container(
                                padding: EdgeInsets.all(5),
                                child: new Wrap(
                                  children: <Widget>[
                                    new ListTile(
                                        leading: new Icon(Icons.call),
                                        title: new Text(widget.OwnDetail.created_by!.phone!),
                                        onTap: () => {}
                                    ),

                                  ],
                                ),
                              );
                            }
                        );

                      },
                    ),
                  ),
                ),
              ),
            ],
          ),


        ]
      ),
    );

    // return  SafeArea(
    //   left: true,
    //   right: true,
    //   child: Container(
    //
    //    color: Colors.red,
    //     margin: EdgeInsets.fromLTRB(10, appPadding, 0 , appPadding),
    //     width: width,
    //     child: Row(
    //       mainAxisSize: MainAxisSize.max,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         ClipRRect(
    //           borderRadius: BorderRadius.circular(100),
    //           child: Image.asset(
    //             'assets/villa.jfif',
    //             width: 65,
    //             height: 65,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //         Container(
    //
    //           margin: EdgeInsets.only(left: 10),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(
    //                 // margin: EdgeInsets.only(left: 10),
    //
    //                 child: Text("Suliman Almamari", style: TextStyle(
    //                     fontSize: 16
    //                 ),),
    //
    //               ),
    //               Container(
    //                 margin: EdgeInsets.only( top: 10),
    //
    //                 child: Text("Owner", style: TextStyle(
    //                     fontSize: 16
    //                 ),),
    //               ),
    //             ],
    //           ),
    //
    //         ),
    //           Align(
    //
    //           child: Container(
    //
    //             width: width/2.5 ,
    //             color: Colors.green,
    //       //      margin: EdgeInsets.fromLTRB(0, 10, 15 , width *0.12),
    //
    //             child: Row(
    //
    //               children: [
    //
    //                 Container(
    //
    //
    //                   padding: EdgeInsets.only(right: width/30),
    //
    //                   child: Material(
    //                     borderRadius: BorderRadius.circular(30),
    //                     color: Colors.transparent,
    //                     clipBehavior: Clip.antiAlias,
    //                     child: Ink(
    //                       width: 40,
    //                       height: 40,
    //                       decoration: BoxDecoration(
    //                           color: secondaryBackground,
    //                           border: Border.all(
    //                               color: Colors.transparent,
    //                               width: 1
    //                           )
    //                       ),
    //
    //                       child: IconButton(
    //                         icon: Icon(Icons.message),
    //                         color: AppButtons,
    //                         //iconSize: 20,
    //                         onPressed: () {
    //
    //                         },
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //
    //                 Container(
    //
    //                   child: Material(
    //                     borderRadius: BorderRadius.circular(30),
    //                     color: Colors.transparent,
    //                     clipBehavior: Clip.antiAlias,
    //                     child: Ink(
    //                       width: 40,
    //                       height: 40,
    //                       decoration: BoxDecoration(
    //                           color: secondaryBackground,
    //                           border: Border.all(
    //                               color: Colors.transparent,
    //                               width: 1
    //                           )
    //                       ),
    //
    //                       child: IconButton(
    //                         icon: Icon(Icons.call),
    //                         color: AppButtons,
    //                         //iconSize: 20,
    //                         onPressed: () {
    //
    //                         },
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         )
    //
    //       ],
    //     ),
    //   ),
    // );

  }

  bool _isLoading = false;
  void AddReport({required String name, required String description, required int to, required int ItemID,}) async {

    print("j");
    bool? chk1;

    setState(() {
      _isLoading = false;

    });
    chk1 = await ItemServices().CreateReport(name: name, description: description, to: to, item: ItemID);
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
                    "Report sent!",
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
