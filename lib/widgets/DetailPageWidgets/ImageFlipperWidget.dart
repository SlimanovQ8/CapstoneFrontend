import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/constants.dart';

class ImageFlipper extends StatefulWidget {
  const ImageFlipper({Key? key}) : super(key: key);

  @override
  _ImageFlipperState createState() => _ImageFlipperState();
}
PageController? pageViewController;


class _ImageFlipperState extends State<ImageFlipper> {
  @override
  bool isClicked = false;
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        width: double.infinity,
                  height: 180,



                  child: Image.asset(
                    'assets/images/campaign.jfif',
                    width: 100,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),






      );
  }
}
