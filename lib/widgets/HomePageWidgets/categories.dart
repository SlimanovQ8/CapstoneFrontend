import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tbr3at/constants/constants.dart';
import 'package:tbr3at/models/category.dart';
import 'package:tbr3at/providers/category_provider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedCategoryIndex = 0;


  @override
  List<Category> categoryList = CategoryProvider().categories;

  Widget build(BuildContext context) {
    print(categoryList.length);
    Size size = MediaQuery.of(context).size;

    return Padding(
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
    );
  }
}
