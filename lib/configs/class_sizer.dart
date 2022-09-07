import 'package:flutter/material.dart';

class Sizer {
  static double width({required BuildContext context, required double size}) {
    var dividedSize = size / 100;
    var finalsize = MediaQuery.of(context).size.width * dividedSize;
    return finalsize;
  }

  static double height({required BuildContext context, required double size}) {
    var dividedSize = size / 100;
    var finalsize = MediaQuery.of(context).size.height * dividedSize;
    return finalsize;
  }

  static double fontsize(
      {required BuildContext context, required double size}) {
    var finalsize = MediaQuery.of(context).textScaleFactor * size;
    return finalsize;
  }
}
