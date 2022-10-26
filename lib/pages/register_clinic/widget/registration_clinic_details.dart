import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../configs/class_sizer.dart';
import '../controller/register_clinic_controller.dart';

class RegistrationClinicDetails extends GetView<RegisterClinicController> {
  const RegistrationClinicDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            width: Sizer.width(size: 50, context: context),
            child: Text(
              "Clinic name",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            height: Sizer.height(size: 5, context: context),
            width: Sizer.width(size: 50, context: context),
            child: TextField(
              controller: controller.clinic_name,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
              obscureText: false,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            width: Sizer.width(size: 50, context: context),
            child: Text(
              "Clinic email",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            height: Sizer.height(size: 5, context: context),
            width: Sizer.width(size: 50, context: context),
            child: TextField(
              controller: controller.clinic_email,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
              obscureText: false,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            width: Sizer.width(size: 50, context: context),
            child: Text(
              "Clinic contact",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            height: Sizer.height(size: 5, context: context),
            width: Sizer.width(size: 50, context: context),
            child: TextField(
              controller: controller.clinic_contact,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {
                if (controller.clinic_contact.text.length == 0) {
                } else {
                  if (controller.clinic_contact.text[0] != "9" ||
                      controller.clinic_contact.text.length > 10) {
                    controller.clinic_contact.clear();
                  } else {}
                }
              },
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
              obscureText: false,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            width: Sizer.width(size: 50, context: context),
            child: Text(
              "Clinic address",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            height: Sizer.height(size: 5, context: context),
            width: Sizer.width(size: 50, context: context),
            child: TextField(
              controller: controller.clinic_address,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
              obscureText: false,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            width: Sizer.width(size: 50, context: context),
            child: Text(
              "Clinic username",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            height: Sizer.height(size: 5, context: context),
            width: Sizer.width(size: 50, context: context),
            child: TextField(
              controller: controller.clinic_username,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
              obscureText: false,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            width: Sizer.width(size: 50, context: context),
            child: Text(
              "Clinic password",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            height: Sizer.height(size: 5, context: context),
            width: Sizer.width(size: 50, context: context),
            child: TextField(
              controller: controller.clinic_password,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
              obscureText: true,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            width: Sizer.width(size: 50, context: context),
            child: Text(
              "Clinic Image",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Sizer.fontsize(size: 10, context: context),
                  letterSpacing: 2),
            ),
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          InkWell(
            onTap: () {
              controller.getImage();
            },
            child: Obx(
              () => controller.imagePath.value != ''
                  ? Container(
                      height: Sizer.height(size: 15, context: context),
                      width: Sizer.width(size: 50, context: context),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(controller.imagePath.value))),
                    )
                  : Container(
                      height: Sizer.height(size: 15, context: context),
                      width: Sizer.width(size: 50, context: context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)),
                      child: Icon(Icons.add_a_photo),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
