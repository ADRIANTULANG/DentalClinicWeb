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
              height: Sizer.height(size: 3, context: context),
            ),
            Text(
              "Username",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
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
                  contentPadding: EdgeInsets.only(
                      left: Sizer.width(size: 1, context: context)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 3, context: context),
            ),
            Text(
              "Password",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
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
                  contentPadding: EdgeInsets.only(
                      left: Sizer.width(size: 1, context: context)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 3, context: context),
            ),
            Text(
              "Clinic name",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              height: Sizer.height(size: 5, context: context),
              width: Sizer.width(size: 50, context: context),
              child: TextField(
                controller: controller.account_clinicname,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 2),
                obscureText: false,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(
                      left: Sizer.width(size: 1, context: context)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 3, context: context),
            ),
            Text(
              "Clinic email",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              height: Sizer.height(size: 5, context: context),
              width: Sizer.width(size: 50, context: context),
              child: TextField(
                controller: controller.account_email,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 2),
                obscureText: false,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(
                      left: Sizer.width(size: 1, context: context)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 3, context: context),
            ),
            Text(
              "Clinic contact no.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              height: Sizer.height(size: 5, context: context),
              width: Sizer.width(size: 50, context: context),
              child: TextField(
                controller: controller.account_contact,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 2),
                obscureText: false,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(
                      left: Sizer.width(size: 1, context: context)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 3, context: context),
            ),
            Text(
              "Clinic address",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              height: Sizer.height(size: 5, context: context),
              width: Sizer.width(size: 50, context: context),
              child: TextField(
                controller: controller.account_address,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 2),
                obscureText: false,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(
                      left: Sizer.width(size: 1, context: context)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 5, context: context),
            ),
            InkWell(
              onTap: () {
                if (controller.account_username.text.isEmpty ||
                    controller.account_password.text.isEmpty ||
                    controller.account_address.text.isEmpty ||
                    controller.account_contact.text.isEmpty ||
                    controller.account_email.text.isEmpty ||
                    controller.account_clinicname.text.isEmpty) {
                  Get.snackbar(
                    "Message",
                    "Oops, Missing inputs",
                    colorText: Colors.white,
                    backgroundColor: Colors.redAccent,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  controller.updateClinicAccount();
                }
              },
              child: Container(
                height: Sizer.height(size: 5, context: context),
                width: Sizer.width(size: 50, context: context),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 133, 185, 228)),
                child: Text(
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
