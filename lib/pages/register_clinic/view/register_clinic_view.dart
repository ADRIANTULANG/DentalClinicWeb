import 'package:dentalclinic/configs/class_sizer.dart';
import 'package:dentalclinic/pages/register_clinic/widget/register_add_documents.dart';
import 'package:dentalclinic/pages/register_clinic/widget/register_googlemaps_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/register_clinic_controller.dart';
import '../widget/registration_clinic_details.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class RegisterClinicView extends GetView<RegisterClinicController> {
  const RegisterClinicView();

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterClinicController());
    return Scaffold(
      body: Container(
        height: Sizer.height(size: 100, context: context),
        width: Sizer.width(size: 100, context: context),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Sizer.width(size: 2, context: context),
                  right: Sizer.width(size: 2, context: context)),
              height: Sizer.height(size: 15, context: context),
              width: Sizer.width(size: 100, context: context),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create an account",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                        fontSize: Sizer.fontsize(size: 22, context: context)),
                  ),
                  Obx(
                    () => controller.isCreating.value == false
                        ? InkWell(
                            onTap: () {
                              if (controller.clinic_name.text.isEmpty ||
                                  controller.clinic_email.text.isEmpty ||
                                  controller.clinic_address.text.isEmpty ||
                                  controller.clinic_contact.text.isEmpty ||
                                  controller.clinic_username.text.isEmpty ||
                                  controller.clinic_password.text.isEmpty) {
                                Get.snackbar(
                                  "Message",
                                  "Oopss. Missing input",
                                  colorText: Colors.white,
                                  backgroundColor: Colors.redAccent,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              } else if (controller.latlng ==
                                  LatLng(0.0, 0.0)) {
                                Get.snackbar(
                                  "Message",
                                  "Oopss. Please select a location on google map",
                                  colorText: Colors.white,
                                  backgroundColor: Colors.redAccent,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              } else if (controller.imagePath.value == "" ||
                                  controller.imagePathBir.value == "" ||
                                  controller.imagePathDTIPermit.value == "" ||
                                  controller.imagePathPhilGeps.value == "" ||
                                  controller.imagePathBusinessPermit.value ==
                                      "") {
                                Get.snackbar(
                                  "Message",
                                  "Oopss. Please upload clinic image and required documents",
                                  colorText: Colors.white,
                                  backgroundColor: Colors.redAccent,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              } else {
                                controller.createClinicAccount();
                              }
                            },
                            child: Container(
                              height: Sizer.height(size: 4, context: context),
                              width: Sizer.width(size: 8, context: context),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: Color.fromARGB(255, 169, 191, 230)),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1,
                                    fontSize: Sizer.fontsize(
                                        size: 18, context: context)),
                              ),
                            ),
                          )
                        : Container(
                            height: Sizer.height(size: 4, context: context),
                            width: Sizer.width(size: 8, context: context),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Color.fromARGB(255, 169, 191, 230)),
                            child: Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            )),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: Sizer.height(size: 80, context: context),
                  width: Sizer.width(size: 30, context: context),
                  child: RegistrationClinicDetails(),
                ),
                Container(
                    height: Sizer.height(size: 80, context: context),
                    width: Sizer.width(size: 30, context: context),
                    child: RegistrationGoogleMapsView()),
                Container(
                  height: Sizer.height(size: 80, context: context),
                  width: Sizer.width(size: 30, context: context),
                  child: RegisterAddSupportingDocuments(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
