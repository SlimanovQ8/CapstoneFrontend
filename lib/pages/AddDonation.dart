import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddDonationPage extends StatefulWidget {
  const AddDonationPage({Key? key}) : super(key: key);

  @override
  State<AddDonationPage> createState() => _AddDonationPageState();
}

class _AddDonationPageState extends State<AddDonationPage> {
  String? _newValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text('Add Donation'),
          // ),
          body: ListView(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(20),
                  child: Center(child: Text('Add Donation'))),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Items Description',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                  ),
                ),
              ),
              // add dropdown item for the type of donation
              Container(
                margin: EdgeInsets.all(20),
                child: DropdownButton<String>(
                  hint: Text('Item Status'),
                  items: <String>['New', 'Like New', 'Old'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: _newValue,
                  onChanged: (value) {
                    setState(() {
                      _newValue = value;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: RaisedButton(
                  child: Text('Save'),
                  onPressed: () {},
                ),
              ),
            ],
            // child: Center(
            //   child: Container(
            //     width: 200,
            //     height: 200,
            //     child: Column(
            //       children: [
            //         Container(
            //           padding: EdgeInsets.all(10),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               labelText: "Amount",
            //               border: OutlineInputBorder(),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.all(10),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               labelText: "Description",
            //               border: OutlineInputBorder(),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.all(10),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               labelText: "Location",
            //               border: OutlineInputBorder(),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.all(10),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               labelText: "Date",
            //               border: OutlineInputBorder(),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.all(10),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               labelText: "Time",
            //               border: OutlineInputBorder(),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.all(10),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               labelText: "Category",
            //               border: OutlineInputBorder(),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.all(10),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               labelText: "Tags",
            //               border: OutlineInputBorder(),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.all(10),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               labelText: "Image",
            //               border: OutlineInputBorder(),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.all(10),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               labelText: "Video",
            //               border: OutlineInputBorder(),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        ));
  }
}
