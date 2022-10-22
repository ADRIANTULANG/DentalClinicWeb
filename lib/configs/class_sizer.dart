import 'package:flutter/material.dart';

class Sizer {
  static double width({
    required double size,
    required BuildContext context,
  }) {
    var dividedSize = size / 100;
    var finalsize = MediaQuery.of(context).size.width * dividedSize;
    return finalsize;
  }

  static double height({
    required double size,
    required BuildContext context,
  }) {
    var dividedSize = size / 100;
    var finalsize = MediaQuery.of(context).size.height * dividedSize;
    return finalsize;
  }

  static double fontsize({
    required double size,
    required BuildContext context,
  }) {
    var finalsize = MediaQuery.of(context).textScaleFactor * size;
    return finalsize;
  }
}
