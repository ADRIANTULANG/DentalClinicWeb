import 'package:dentalclinic/configs/class_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/web_clinic_home_controller.dart';

class Settings extends GetView<WebClinicController> {
  const Settings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Sizer.height(size: 5, context: context),
            ),
            Text(
              "Settings",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Sizer.fontsize(size: 20, context: context),
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: Sizer.height(size: 5, context: context),
            ),
            Container(
              height: Sizer.height(size: 5, context: context),
              width: Sizer.width(size: 50, context: context),
              child: TextField(
                controller: controller.account_username,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 2),
                obscureText: false,
                decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(left: Sizer.width(size: 1, context: context)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
             SizedBox(
              height: Sizer.height(size: 5, context: context),
            ),
            Container(
              height: Sizer.height(size: 5, context: context),
              width: Sizer.width(size: 50, context: context),
              child: TextField(
                controller: controller.account_password,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 2),
                obscureText: false,
                
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(left: Sizer.width(size: 1, context: context)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
                SizedBox(
              height: Sizer.height(size: 5, context: context),
            ),
            InkWell(
              onTap: (){
                controller.updateClinicAccount();
              },
              child: Container(
                     height: Sizer.height(size: 5, context: context),
                width: Sizer.width(size: 50, context: context),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 133, 185, 228)
                ),
                child:   Text(
                "UPDATE",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Sizer.fontsize(size: 13, context: context),
                    letterSpacing: 1.5),
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
