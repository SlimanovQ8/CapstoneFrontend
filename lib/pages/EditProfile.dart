import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          //create edit profile page
          Scaffold(
        appBar: AppBar(
          title: Container(
              margin: EdgeInsets.only(right: 55),
              child: Center(child: Text('Edit Profile'))),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(color: Colors.blue[200]),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.blue[200]),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon:
                      Icon(Icons.supervisor_account, color: Color(0xff46bbab)),
                  hintText: 'Username',
                ),
                onChanged: (value) {},
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.email_rounded, color: Color(0xff46bbab)),
                  hintText: 'Email',
                ),
                onChanged: (value) {},
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.phone, color: Color(0xff46bbab)),
                  hintText: 'Phone Number',
                ),
                onChanged: (value) {},
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.vpn_key, color: Color(0xff46bbab)),
                  hintText: 'Password',
                ),
                onChanged: (value) {},
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.vpn_key, color: Color(0xff46bbab)),
                  hintText: 'Confirm Password',
                ),
                onChanged: (value) {},
              ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
