import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tbr3at/models/charity.dart';

import '../models/user.dart';
import '../providers/auth_provider.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override

  String name = "";
  String username = "";
  String email = "";
  String password = "";
  String phone = "";
  String location = "";
  bool _isLoading = false;
  bool isUserPressed = true;
  File? _image;

  bool isEmailValid = true;
  bool isPhoneValid = true;
  bool isUsernameValid = true;
  bool chk = false;
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }
  Widget build(BuildContext context) {

    final _picker = ImagePicker();

    Size size = MediaQuery.of(context).size;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      body: Container(
        child: ListView(
          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff0bac9a),
                      Color(0xff0b8f9b),
                      Color(0xff0b919a),

                    ],
                  ),
                  borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 40,
                    left: 120,
                    child: ImageIcon(
                      AssetImage("assets/images/donate.png"),
                      color: Colors.white,
                      size: 150,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 30,

                    child: Text("Register", style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),)
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onPressed: () {

                        setState(() {
                          isUserPressed = true;
                        });

                      },
                      child: SizedBox(
                        child: Text("User") ,

                      ),

                      color: isUserPressed == true ?
                      Color(0xff46bbab) : Color(0Xffe4e4e4)
                  ),
                  SizedBox(width: 20,),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onPressed: () {
                        setState(() {
                          isUserPressed = false;

                        });

                      },
                      child: SizedBox(
                          child: Text("Charity")),
                      color: isUserPressed == false ?
                      Color(0xff46bbab) : Color(0Xffe4e4e4)
                  ),
                ],
              ),
            ),
      Container(
        //color: Colors.red,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              padding:
              EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2)
                  ]),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.person,
                      color:  Color(0xff46bbab)),
                  hintText: isUserPressed? 'Name' : 'Charity Name',
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),

            ),


            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),

              padding:
              EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2)
                  ]),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.mail,
                      color:  Color(0xff46bbab)),
                  hintText: 'Email',
                ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            ),
            isUserPressed ? Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),

              padding:
              EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2)
                  ]),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.person,
                      color:  Color(0xff46bbab)),
                  hintText: 'Username',
                ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },

              ),
            )
            : Container()
,
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding:
              EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2)
                  ]),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.vpn_key,
                      color:  Color(0xff46bbab)
                  ),
                  hintText: 'Password',
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding:
              EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2)
                  ]),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,

                  icon: Icon(Icons.phone,
                      color:  Color(0xff46bbab)
                  ),
                  hintText: 'Phone',

                ),
                keyboardType: TextInputType.number,

                inputFormatters: <TextInputFormatter> [
                  FilteringTextInputFormatter.digitsOnly


                ],
                onChanged: (value) {
                  phone = value;
                },
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding:
              EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2)
                  ]),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.location_on,
                      color:  Color(0xff46bbab)
                  ),
                  hintText: 'Location',
                ),
                onChanged: (value) {
                  location = value;
                },
              ),
            ),

            SizedBox(
              height: 10,
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
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:  chk == true ? FileImage(_image!) as ImageProvider : AssetImage("assets/images/user.png") as ImageProvider
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
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            final XFile? image = await _picker.pickImage(
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

    ]
        ),
      ),
            Container(
              width:  MediaQuery.of(context).size.width * 0.3 ,
              height: 45,
              margin: EdgeInsets.all( 30),
              child: _isLoading ? Center(
                child: CircularProgressIndicator(
                  color:  Color(0xff46bbab),
                ),
              ): ElevatedButton(
                child: Text("Register",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),

                ),
                style: ElevatedButton.styleFrom(
                  primary:  Color(0xff46bbab),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),

                onPressed: () {
                  print(name);
                  print(email);
                  print(username);
                  print(password);

                 isUserPressed?  SignUp(name, email, username, password, phone, location, _image!): CharitySignUp(name, email, password, phone, location, _image!);

                },
              ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account ?"),
                  InkWell(
                    child: Text(
                      " Sign In",
                      style: TextStyle(color:  Color(0xff46bbab)),
                    ),
                    onTap: () {
                       context.push("/signin");
                    },
                  ),
                ],
              

            ),

          ],
        ),
      ),
    );
  }
  void SignUp(String name, String email, String username, String password, String phone, String location, File image ) async {
    print("j");
    bool? chk;

    setState(() {
      _isLoading = true;

    });
    chk = await Provider.of<AuthProvider>(context, listen: false).signup(user: User(
      name: name,
      email: email,
      username: username,
      password: password,
      phone: phone,
      image: image.path,
      location: location,
    ));
    print(chk);
    if (chk)
      {
        context.push("/homepage");
        setState(() {
          _isLoading = false;
        });

     }
    else {
      _isLoading = false;
      }


  }
  void CharitySignUp(String name, String email, String password, String phone, String location, File image) async {
    print("j");
    bool? chk;

    setState(() {
      _isLoading = true;

    });
    chk = await Provider.of<AuthProvider>(context, listen: false).CharitySignUp(user: User(
      charityname: name,
      email: email,
      username: name,
      name: name,
      password: password,
      phone: phone,
      image: image.path ,
      location: location,
    ));
    print(chk);
    if (chk)
    {
      context.push("/homepage");
      setState(() {
        _isLoading = false;
      });

    }
    else {
      _isLoading = false;
    }


  }

}
