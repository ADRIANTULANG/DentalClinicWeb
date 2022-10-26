import 'package:dentalclinic/pages/register_clinic/controller/register_clinic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/class_sizer.dart';

class RegisterAddSupportingDocuments extends GetView<RegisterClinicController> {
  const RegisterAddSupportingDocuments();

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
              "BIR Permit",
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
              controller.getImageBir();
            },
            child: Obx(
              () => controller.imagePathBir.value != ''
                  ? Container(
                      height: Sizer.height(size: 15, context: context),
                      width: Sizer.width(size: 50, context: context),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image:
                                  NetworkImage(controller.imagePathBir.value))),
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
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            width: Sizer.width(size: 50, context: context),
            child: Text(
              "Business Permit",
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
              controller.getImageBusinessPermit();
            },
            child: Obx(
              () => controller.imagePathBusinessPermit.value != ''
                  ? Container(
                      height: Sizer.height(size: 15, context: context),
                      width: Sizer.width(size: 50, context: context),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(
                                  controller.imagePathBusinessPermit.value))),
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
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            width: Sizer.width(size: 50, context: context),
            child: Text(
              "DTI",
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
              controller.getImageDTI();
            },
            child: Obx(
              () => controller.imagePathDTIPermit.value != ''
                  ? Container(
                      height: Sizer.height(size: 15, context: context),
                      width: Sizer.width(size: 50, context: context),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(
                                  controller.imagePathDTIPermit.value))),
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
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Container(
            width: Sizer.width(size: 50, context: context),
            child: Text(
              "PhilGeps",
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
              controller.getImagePhilGeps();
            },
            child: Obx(
              () => controller.imagePathPhilGeps.value != ''
                  ? Container(
                      height: Sizer.height(size: 15, context: context),
                      width: Sizer.width(size: 50, context: context),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(
                                  controller.imagePathPhilGeps.value))),
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
          // IconButton(
          //     onPressed: () {
          //       controller.startFilePicker();
          //     },
          //     icon: Icon(Icons.camera))
        ],
      ),
    );
  }
}
