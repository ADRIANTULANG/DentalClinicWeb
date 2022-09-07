import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/class_sizer.dart';
import '../../../constant/endPoints.dart';

class ClinicDocumentsDialogs {
  static showImageDialog(
      {required BuildContext context, required String image}) {
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: Container(
        height: Sizer.height(context: context, size: 90),
        width: Sizer.width(context: context, size: 70),
        color: Colors.white,
        child: Image.network(
          "${AppEndpoint.endPointDomain_image}/$image",
          height: Sizer.height(context: context, size: 90),
          width: Sizer.width(context: context, size: 70),
          fit: BoxFit.contain,
        ),
      ),
    ));
  }
}
