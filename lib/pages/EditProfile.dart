import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile> {

  bool showPassword = false;
  File? _image;
  String username = "";
  String password = "";
  String Bio = "";
  bool chk = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final _picker = ImagePicker();

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 228, 228, 228),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromRGBO(240, 123, 63, 1)),
          backgroundColor: Color.fromARGB(255, 228, 228, 228),
          title: Padding(
            padding: const EdgeInsets.only(left: 70.0),
            child: Text(
              "My Profile",
              style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
            ),
          ),
        ),
        body: Consumer<AuthProvider>(
            builder: (context, authProvider, child) =>

                Container(
                  padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                  child: GestureDetector(

                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ListView(
                      children: [
                        Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(240, 123, 63, 1)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
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
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/images/user.png") as ImageProvider

                                       )),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 4,
                                        color: Theme
                                            .of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                      color: Colors.green,
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        final XFile? image = await _picker
                                            .pickImage(
                                            source: ImageSource.gallery);
                                        setState(() {
                                          _image = File(image!.path);
                                          print(_image);

                                          chk = true;
                                        });
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,

                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Container(
                          //color: Colors.red,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          padding: EdgeInsets.only(top: 62),
                          child: Column(
                              children: <Widget>[


                                Text(
                                  "Bio",
                                  style: TextStyle(fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(240, 123, 63, 1)),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 1.2,
                                  margin: EdgeInsets.only(top: 20),
                                  padding:
                                  EdgeInsets.only(
                                      top: 4, left: 16, right: 16, bottom: 4),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2)
                                      ]),
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 6,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,


                                    ),
                                    onChanged: (value) {
                                      Bio = value;
                                    },
                                  ),
                                ),
                              ]
                          ),
                        ),


                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.3,
                          height: 45,
                          margin: EdgeInsets.all(30),
                          child: isLoading ? Center(
                            child: CircularProgressIndicator(
                              color: Color(0xffee8200),
                            ),
                          ) : ElevatedButton(
                            child: Text("Update",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),

                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffee8200),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),

                            onPressed: () {
                              update(authProvider.user.userID!, Bio, _image!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
        )
    );
  }

  void update(int UserID, String Bio, File img) async {
    print("j");

    setState(() {
      isLoading = true;
    });
    bool? chk;

    chk = false;


    if (chk) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(
                title: Text(
                  "Profile Updated",
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                content: Text(
                  "Your profile has updated successfully!",
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        context.push("/homepage");
                      });
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Color.fromRGBO(240, 123, 63, 1)
                      ),
                    ),
                  ),

                ],
              ));
    }
    else {
      setState(() {
        isLoading = true;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(
                title: Text(
                  "Error",
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                content: Text(
                  "There is an error occurred!",
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        context.push("/homepage");
                      });
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Color.fromRGBO(240, 123, 63, 1)
                      ),
                    ),
                  ),

                ],
              ));
    }
  }
}