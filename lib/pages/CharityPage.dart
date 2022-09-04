import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tbr3at/widgets/HomePageWidgets/CharitNavBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tbr3at/constants/constants.dart';
import 'package:tbr3at/models/category.dart';
import 'package:tbr3at/providers/auth_provider.dart';
import 'package:tbr3at/providers/category_provider.dart';
import 'package:tbr3at/widgets/HomePageWidgets/BottomNavBar.dart';

import '../classes/CustomAnimatedBottomBar.dart';
import '../widgets/HomePageWidgets/Annoucements.dart';
import '../widgets/HomePageWidgets/SearchBar.dart';
import '../widgets/HomePageWidgets/categories.dart';
import '../widgets/HomePageWidgets/BottomNavBar.dart';

class CharityHomePage extends StatefulWidget {
  const CharityHomePage({Key? key}) : super(key: key);

  @override
  _CharityHomePageState createState() => _CharityHomePageState();
}
class _CharityHomePageState extends State<CharityHomePage> {
  @override

  final _inactiveColor = Colors.grey;
  final _ActiveColor = AppButtons;
  int _currentIndex = 0;
  int selectedCategoryIndex = 0;


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) => Scaffold(


        backgroundColor: Color(0xfff5f5fd),

        appBar: AppBar(
          title: Text("Welcome ${authProvider.user.username}", style: TextStyle(color: Colors.black),),
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
        body:  _currentIndex == 3?  Container(

          padding: EdgeInsets.only(left: 16, top: 25, right: 16),

          child: ListView(
            children: [

              Text(
                "Settings",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, ),
              ),

              Card(
                child: ListTile(
                  title: Text(authProvider.user.username!),
                  subtitle: Text(
                      "${authProvider.user.numOfDonation!}"
                  ),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    child: Text(
                      (authProvider.user.username!.substring(0, 2).toUpperCase()),
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                  isThreeLine: true,
                  trailing: Icon(Icons.arrow_forward_ios),

                ),
              ),

              Card(

                child: ListTile(

                  onTap: (){
                    context.push("/editProfile");
                  },
                  leading: Icon(Icons.settings),
                  title: Text('Edit Profile'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),


              Card(
                child: ListTile(
                  onTap: (){
                    context.push("/MyItems", extra: authProvider.user);
                  },
                  leading: Icon(Icons.category),
                  title: Text('My Items'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),


              Card(
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Sign out'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        )
            :Stack(


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
                                child: Text("Make Announcement ", style: TextStyle(
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
                                          itemCount: category.categories.length + 1,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(

                                              onTap: () {

                                                setState(() {
                                                  selectedCategoryIndex = index;
                                                  print("Category Id: ${selectedCategoryIndex} ");

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
                                                      index == 0 ? "All" :
                                                      category.categories[index-1].name!,
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
                      //
                      // Container(
                      //   child: Text(
                      //     "See All",
                      //     //overflow: TextOverflow.ellipsis,
                      //
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       color: AppButtons,
                      //
                      //     ),
                      //   ),
                      // ),

                    ],

                  ),
                ),
                Announcement(id: selectedCategoryIndex,),

              ],
            ),
          ],
        ),

        bottomNavigationBar: CustomAnimatedBottomBar(
          containerHeight: 70,
          backgroundColor: Colors.white,
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: _ActiveColor ,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.leaderboard),
              title: Text('leaderboard'),
              activeColor: _ActiveColor,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),

            BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text(
                'Inbox ',
              ),
              activeColor: _ActiveColor,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: _ActiveColor,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
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

