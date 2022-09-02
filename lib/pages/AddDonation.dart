import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class AddDonationPage extends StatefulWidget {
  const AddDonationPage({Key? key}) : super(key: key);

  @override
  State<AddDonationPage> createState() => _AddDonationPageState();
}

var _image;
final _picker = ImagePicker();

class _AddDonationPageState extends State<AddDonationPage> {
  String? _newValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Add Donation'),
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Image"),
                )
              ],
            ),
          ),
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
              hint: Text('Item Condition'),
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
              color: Color.fromARGB(255, 1, 143, 131),
              child: Text('Save',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
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
