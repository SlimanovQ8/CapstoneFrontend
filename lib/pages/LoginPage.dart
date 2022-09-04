import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/auth_provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String username = "";
  bool _isLoading = false;
  bool isUserPressed = false;
  String password = "";
  Widget build(BuildContext context) {
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
                      // color: Colors.white,
                      size: 150,
                    ),
                  ),
                  Positioned(
                      bottom: 40,
                      right: 30,

                      child: Text("Login", style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),)
                  ),
                ],
              ),
            ),


            Container(
              //color: Colors.red,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                  children: <Widget>[



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
                          icon: Icon(Icons.person,
                              color: Color(0xff46bbab)
                          ),
                          hintText: 'Username',
                        ),
                        onChanged: (value) {
                          setState(() {
                            username = value;
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
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.vpn_key,
                              color: Color(0xff46bbab)
                          ),
                          hintText: 'Password',
                        ),
                        onChanged: (value) {
                          password = value;
                        },
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
                  color: Color(0xff46bbab),
                ),
              ): ElevatedButton(
                child: Text("Login",
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
                  print(username);
                  print(password);
                  SignIn( username, password);

                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account ?"),
                InkWell(
                  child: Text(
                    " Sign Up",
                    style: TextStyle(color: Color(0xff46bbab)
                    ),
                  ),
                  onTap: () {
                     context.push("/");
                  },
                ),
              ],


            ),

          ],
        ),
      ),
    );
  }
  void SignIn(String username, String password, ) async {
    print("j");

    print("j");
    int? chk;

    setState(() {
      _isLoading = true;

    });
    chk = await Provider.of<AuthProvider>(context, listen: false).signin(user: User(

        username: username,
        password: password,
    ));

    print(chk);
    if (chk == 2)
    {
      context.push("/homepage", );
      setState(() {
        _isLoading = false;
      });

    }

    else if (chk == 1)
    {
      context.push("/charityHomePage", );
      setState(() {
        _isLoading = false;
      });

    }
    else {
      _isLoading = false;
    }




  }
}
