import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {

      },
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.asset(
                  ""
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("gb"),
                      Text(
                        "uyhjf" ,
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 0.0,
          )
        ],
      ),
    );
  }
}
