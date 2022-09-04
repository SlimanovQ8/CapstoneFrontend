import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tbr3at/constants/constants.dart';
import 'package:tbr3at/models/item.dart';
import 'package:tbr3at/models/user.dart';
import 'package:tbr3at/providers/item_provider.dart';

import '../providers/announcement_provider.dart';

class MyItems extends StatefulWidget {
  User UserID;
   MyItems({Key? key,
    required this.UserID,

  }) : super(key: key);

  @override
  _MyItemsState createState() => _MyItemsState();
}

class _MyItemsState extends State<MyItems> {
  @override
  List<Item> myItems = [];
  Widget build(BuildContext context) {
    return Scaffold(




      backgroundColor: Color(0xfff5f5fd),

      appBar: AppBar(
        title: Text("Items", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Color(0xffffffff),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.green.withOpacity(0.5),
                  Colors.greenAccent.withOpacity(0.7),
                  Colors.greenAccent.withOpacity(0.7)
                ]),
          ),
        ),
      ),
      body:  Container(

      child: Container(
        margin: EdgeInsets.only(bottom: 20),
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
                  child: Text('There are no Items', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                );
              } else {
                myItems = context.read<ItemProvider>().items.where((element) => element.created_by!.id! == widget.UserID.id!).toList();
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40, bottom: 20),
                        child:
                        Text("My Items", style: TextStyle(
                          fontSize: 20,

                        ),)
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                          itemCount: myItems.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              borderOnForeground: true,
                              elevation: 10,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 4,
                                              color: Theme
                                                  .of(context)
                                                  .scaffoldBackgroundColor),
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                                color: Colors.black.withOpacity(0.1),
                                                offset: Offset(0, 10))
                                          ],

                                          image: DecorationImage(
                                            fit: BoxFit.fitWidth,
                                              image: NetworkImage(
                                                  "${myItems[index].image}") as ImageProvider,


                                          )),
                                    ),
                                    title: Text("${myItems[index].name}",
                                        style: TextStyle(
                                            color: Colors.green,
                                          fontSize: 25
                                        )),
                                    subtitle: Text(
                                      myItems[index].isReserved!?   "Reserved by: " + "${myItems[index].category_name!.name!}" : " Not Reserved yet!",
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),

                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(

                                        height: 30,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: ElevatedButton(
                                          child: Text("Update",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white
                                            ),

                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Color(0xff46bbab),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(25),
                                            ),
                                          ),

                                          onPressed: () {


                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(

                                        margin: EdgeInsets.only(bottom: 10),

                                        height: 30,
                                        child: OutlinedButton(
                                          child: Text("Delete",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black
                                            ),

                                          ),
                                          style: OutlinedButton.styleFrom(
                                            primary: Colors.red,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(25),
                                            ),
                                          ),

                                          onPressed: () {

                                            DeleteItem(myItems[index].id!);

                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );

                          }),
                    ),
                  ],
                );
              }
            }
          },
        ),


      ),
    ),
    );
  }
  void DeleteItem(int ItemID,) async {
    print("j");
    bool? chk;

    showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: Text(
                "Are You sure?",
                style: TextStyle(color: AppButtons),
              ),
              content: Text(
                "Do you want to delete this Item?",
                style: TextStyle(color: AppButtons),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    chk =  await Provider.of<ItemProvider>(context, listen: false)
                        .DeleteItem(ItemID);


                      // if (chk!)
                      setState(() {
                        Navigator.of(context).pop();
                      });



                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.grey),
                  onPressed: () {
                      Navigator.of(context).pop();
                  },
                  child: Text(
                    'No',
                    style: TextStyle(color: AppButtons),
                  ),
                ),
              ],
            ));
  }
}
