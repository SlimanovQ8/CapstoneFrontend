import 'package:flutter/material.dart';
import 'package:tbr3at/constants/constants.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedCategoryIndex = 0;
  List<String> categoryList = [
    '   All   ',
    'Education',
    'Food',
    'Medic',
    'Clothes',
  ];
  Widget _buildCategory(BuildContext context, int index) {
    return GestureDetector(

      onTap: () {

        setState(() {
          selectedCategoryIndex = index;
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
              categoryList[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.5,
                  color: selectedCategoryIndex == index ? white : Color(0xffbababa)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        top: 10,
        bottom: 0,
      ),
      child: Container(
        height: size.height * 0.05,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return _buildCategory(context, index);
          },
        ),
      ),
    );
  }
}
