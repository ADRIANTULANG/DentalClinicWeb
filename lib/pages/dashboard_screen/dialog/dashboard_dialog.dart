import 'package:dentalclinic/pages/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/class_sizer.dart';

class DashboardDialog {
  static showConfirmToDelete(
      {required BuildContext context,
      required DashboardController controller,
      required String clientID}) {
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: Container(
        height: Sizer.height(context: context, size: 20),
        width: Sizer.width(context: context, size: 30),
        padding: EdgeInsets.only(
          left: Sizer.width(context: context, size: 2),
          right: Sizer.width(context: context, size: 2),
          top: Sizer.width(context: context, size: 2),
          bottom: Sizer.width(context: context, size: 2),
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Are you sure you want to delete this client ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Sizer.fontsize(context: context, size: 20),
                  letterSpacing: 2),
            ),
            Container(
              width: Sizer.width(context: context, size: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.deleteClient(clientID: clientID);
                      Get.back();
                    },
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizer.fontsize(context: context, size: 12),
                          letterSpacing: 1),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "No",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: Sizer.fontsize(context: context, size: 12),
                          letterSpacing: 2),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
