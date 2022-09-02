import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tbr3at/constants/constants.dart';
import 'package:tbr3at/models/category.dart';
import 'package:tbr3at/providers/category_provider.dart';
import 'package:tbr3at/widgets/HomePageWidgets/BottomNavBar.dart';

import '../widgets/HomePageWidgets/Annoucements.dart';
import '../widgets/HomePageWidgets/SearchBar.dart';
import '../widgets/HomePageWidgets/categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int selectedCategoryIndex = 0;


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(

      backgroundColor: Color(0xfff5f5fd),

      appBar: AppBar(
        title: Text("Tbr3at", style: TextStyle(color: Colors.black),),
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
      body:  Stack(

        alignment: Alignment.bottomCenter,
        children: [
          Column(

            children: [
              Container(
                height: 250,
                padding: EdgeInsets.only(top: 40),
                color: Color(0xfffffff),
                child: Column(
                  children: [
                    Container(
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
                              child: Text("Donate ", style: TextStyle(
                                fontSize: 20,
                              ),),
                              onPressed: () {


                                List<String> categories=  [];
                                getCategoryNames();
                                // context.push("/itemDonate");

                              },
                            )


                          ],
                        ),
                      ),
                    ),
                    SearchBar(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        top: 10,
                        bottom: 0,
                      ),
                      child:  FutureBuilder(
                        future: Provider.of<CategoryProvider>(context, listen: false).getAllCategory(),
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

                              return Consumer<CategoryProvider>(

                                builder: (context, category, child) =>
                                    Container(
                                      height: size.height * 0.05,
                                      child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: category.categories.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(

                                            onTap: () {

                                              setState(() {
                                                selectedCategoryIndex = index;
                                                print(selectedCategoryIndex);

                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(right: appPadding / 3.5),
                                              child: Container(

                                                padding: EdgeInsets.symmetric(horizontal: appPadding / 2),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: selectedCategoryIndex == index ? Colors.transparent : Color(0xffe3e3e3)
                                                  ),
                                                  color:
                                                  selectedCategoryIndex == index ? AppButtons : Color(0xfffefefe),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    category.categories[index].name!,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16.5,
                                                        color: selectedCategoryIndex == index ? white : Color(0xffbababa)),
                                                  ),
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
                        },
                      ),
                    ),

                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(

                      child: Text(
                        'Lastest Campaigns',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      child: Text(
                        "See All",
                        //overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          fontSize: 16,
                          color: AppButtons,

                        ),
                      ),
                    ),

                  ],

                ),
              ),
              Announcement(id: selectedCategoryIndex,),

            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomBar(),
    );
  }

  void getCategoryNames() async {
     void a= await CategoryProvider().getAllCategory();

    List <Category> c = await CategoryProvider().getCategoryNames();
    List<String> CategoryNames = [];

    for (int i = 0; i< c.length; i++)
      CategoryNames.add(c[i].name!);

    context.push("/ItemDonate", extra: CategoryNames);
  }
}
