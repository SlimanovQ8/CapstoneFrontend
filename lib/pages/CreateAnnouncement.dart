// ignore: file_names
// ignore_for_file: prefer_const_constructors,, prefer_const_literals_to_create_immutables
// use_key_in_widget_constructors,
// library_private_types_in_public_api,
// prefer_const_literals_to_create_immutables,
// unnecessary_import,
// unused_import
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tbr3at/providers/announcement_provider.dart';
import 'package:tbr3at/providers/item_provider.dart';

class CreateAnnouncement extends StatefulWidget {
  final List <String> CategoryName;
  const CreateAnnouncement({Key? key,
    required this.CategoryName,
  }) : super(key: key);
  @override
  _CreateAnnouncementState createState() => _CreateAnnouncementState();
}

class _CreateAnnouncementState extends State<CreateAnnouncement> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }




  String? selectedValue;
  String? selectedCategory;
  bool _isLoading = false;
  XFile? _image;
  String name = '';
  String description = '';
  bool chk = false;
  int? indexCategory;
  int amount = 0;
  final List<String> priority = [
    'High',
    'Medium',
    'Low',
  ];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _selectedDate = 'Tap to select date';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (d != null)
      setState(() {
        _selectedDate = d.year.toString() + '-' + d.month.toString() + '-' + d.day.toString();
      });
  }


  @override

  Widget build(BuildContext context) {
    final List<String> categories = widget.CategoryName;

    final _picker = ImagePicker();

    // the 3 lines below is to change font size based on device size
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double multiplierForTitle = 2.4;
    double TitleFontSize = unitHeightValue * multiplierForTitle;

    Size size = MediaQuery.of(context).size;

    String os = Platform.operatingSystem; // to knwo the os
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isNameEmpty = false;
    bool isDescriptionEmpty = false;
    bool isCategoryEmpty = false;
    bool isConditionEmpty = false;
    bool isPictureEmpty = false;
    return Scaffold(
      backgroundColor: Color(0xfff5f5fd),

      appBar: AppBar(
        title: Text("Make Announcement", style: TextStyle(color: Colors.black),),
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
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: ListView(
/*           // this is to know if the keyboard is open or no
            physics: MediaQuery.of(context).viewInsets.bottom > 0.0
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(), */
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Column(children: [

                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "Category name",
                            style: TextStyle(
                              fontSize: TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "*",
                            style: TextStyle(
                              fontSize: TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: TextFormField(

                        validator: (value) {
                          if (isNameEmpty) {
                            print('fgcv');
                            return 'Item name cannot be empty.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Food Announcement ",
                          fillColor: Colors.white,
                          filled: true,

                        ),

                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "Announcement Description",
                            style: TextStyle(
                              fontSize: TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "*",
                            style: TextStyle(
                              fontSize: TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: TextFormField(
                        validator: (value) {
                          if (isNameEmpty) {
                            print('fgcv');
                            return 'Item name cannot be empty.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        onChanged: (value) {
                          setState(() {
                            description = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "We need food to palestine",

                          fillColor: Colors.white,
                          filled: true,
                          labelStyle:
                          TextStyle(fontSize: 24, color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                        ),

                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "Announcement Category",
                            style: TextStyle(
                              fontSize: TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "*",
                            style: TextStyle(
                              fontSize: TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Center(
                    //   child: Padding(
                    //     padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,

                          hint: Row(
                            children: const [
                              Icon(
                                Icons.list,
                                size: 16,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'Category',
                                  style: TextStyle(
                                    fontSize: 16,
                                    //fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 46, 46, 46),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: categories
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                //fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                              .toList(),
                          value: selectedCategory,

                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value as String;
                              indexCategory = categories.indexOf(selectedCategory!) +1;
                              print(indexCategory);
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Color.fromARGB(255, 0, 0, 0),
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 50,
                          buttonWidth: width,
                          buttonPadding: const EdgeInsets.all(12),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color.fromARGB(66, 255, 255, 255),
                            ),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          itemHeight: 40,

                          itemPadding: const EdgeInsets.only(left: 12, right: 12),
                          dropdownMaxHeight: height,
                          dropdownWidth: width,

                          //here if we want to have a border radis
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(-10, 0),
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "Item Priority",
                            style: TextStyle(
                              fontSize: TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "*",
                            style: TextStyle(
                              fontSize: TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Center(
                    //   child: Padding(
                    //     padding: const EdgeInsets.fromLTR b B(0, 12, 0, 0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,

                          hint: Row(
                            children: const [
                              Icon(
                                Icons.list,
                                size: 16,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'Priority',
                                  style: TextStyle(
                                    fontSize: 16,
                                    //fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 46, 46, 46),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: priority
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                //fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                              .toList(),
                          value: selectedValue,

                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Color.fromARGB(255, 0, 0, 0),
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 50,
                          buttonWidth: width,
                          buttonPadding: const EdgeInsets.all(12),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color.fromARGB(66, 255, 255, 255),
                            ),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          itemHeight: 40,

                          itemPadding: const EdgeInsets.only(left: 12, right: 12),
                          dropdownMaxHeight: height,
                          dropdownWidth: width,

                          //here if we want to have a border radis
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(-10, 0),
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "Announcement Amount",
                            style: TextStyle(
                              fontSize: TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "*",
                            style: TextStyle(
                              fontSize: TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: TextFormField(

                        validator: (value) {
                          if (isNameEmpty) {
                            print('fgcv');
                            return 'Item name cannot be empty.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "1000 KD",
                          fillColor: Colors.white,
                          filled: true,

                        ),

                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp("[0-9]")),
                        ],
                        onChanged: (value) {
                          setState(() {
                            amount = int.parse(value);
                          });
                        },
                      ),
                    ),



                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "Announcement End Date",
                            style: TextStyle(
                              fontSize:  TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "*",
                            style: TextStyle(
                              fontSize: TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(

                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(width: 1.0, color: Colors.black),
                                  left: BorderSide(width: 1.0, color: Colors.black),
                                  right: BorderSide(width: 1.0, color: Colors.black),
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                    child: Text(
                                        _selectedDate,
                                        textAlign: TextAlign.center,

                                        style: TextStyle(color: Color(0xFF000000),
                                        fontSize: 24)
                                    ),
                                    onTap: (){
                                      _selectDate(context);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.calendar_today),
                                    tooltip: 'Tap to open date picker',
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "Announcement Picture",
                            style: TextStyle(
                              fontSize:  TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "*",
                            style: TextStyle(
                              fontSize: TitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                      child: Container(
                          height: height / 4,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(255, 194, 194, 194)),
                          child: chk == false
                              ? SizedBox.fromSize(
                            child: Material(
                              color: Color.fromARGB(255, 194, 194, 194),
                              child: InkWell(
                                splashColor: Colors.black87,
                                onTap: () async {
                                  final XFile? image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    _image = XFile(image!.path);
                                    print(_image);
                                    chk = true;

                                  });

                                },

                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.image,
                                      size: (height + width) / 7.5,
                                      color: Colors.white70,
                                    ), // <-- Icon
                                    Text(
                                      "Pick Image from Gallery",
                                      style: TextStyle(
                                        fontSize: (height + width) / 90,
                                      ),
                                    ), // <-- Text
                                  ],
                                ),
                              ),
                            ),
                          )


                              : Image.file(
                              File(_image!.path),
                              fit: BoxFit.fitWidth)
                      ) ,
                    ),
                    Container(
                      width:  MediaQuery.of(context).size.width * 0.75 ,
                      height: 45,
                      margin: EdgeInsets.all( 30),
                      child: _isLoading && 1==2 ? Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff46bbab),
                        ),
                      ): ElevatedButton(
                        child: Text("Create Announcement",
                          style: TextStyle(
                              fontSize: 20,
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

                          CreateAnnouncement(name, description, indexCategory!, selectedValue!, _image!, _selectedDate, amount);

                        },
                      ),
                    ),
                  ]),
                ),

              ),
            ]),
      ),

    );
  }
  void CreateAnnouncement(String name, String description, int category_name, String priority, XFile image, String endDate, int Amount) async {
    print("j");
    bool? chk1;

    setState(() {
      _isLoading = false;

    });
    chk1 = await Provider.of<AnnouncementProvider>(context, listen: false).CreateAnnouncement(name, description, category_name, priority, image, endDate, Amount);
    print(chk);
    if (chk1!)
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
                    "Announcement has been created successfully",
                    style: TextStyle(color: Color(0xff46bbab)),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        setState(() {
                          context.go("/charityHomePage");
                        });
                      },
                      child: Text(
                        'Return',
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
