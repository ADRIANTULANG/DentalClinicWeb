import 'package:carousel_slider/carousel_slider.dart';
import 'package:dentalclinic/pages/web_clinic_home/controller/web_clinic_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../configs/class_sizer.dart';
import '../model/web_clinic_home_model.dart';

class WebClinicHomeDialog {
  static showDialogEdit({
    required BuildContext context,
    required String servicename,
    required String serviceprice,
    required String servicedescription,
    required String servicesID,
    required WebClinicController controller,
  }) {
    TextEditingController name = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController description = TextEditingController();

    name.text = servicename;
    price.text = serviceprice;
    description.text = servicedescription;

    Get.dialog(AlertDialog(
      content: Container(
        color: Colors.white,
        height: Sizer.height(size: 50, context: context),
        width: Sizer.width(size: 30, context: context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Sizer.height(size: 2, context: context),
            ),
            Text(
              "UPDATE SERVICES",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: Sizer.fontsize(size: 18, context: context)),
            ),
            SizedBox(
              height: Sizer.height(size: 2, context: context),
            ),
            Text(
              "Name",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: Sizer.fontsize(size: 12, context: context)),
            ),
            SizedBox(
              height: Sizer.height(size: .3, context: context),
            ),
            Container(
              // padding: EdgeInsets.only(left: 5.w, right: 5.w),
              height: Sizer.height(size: 5, context: context),
              width: Sizer.width(size: 100, context: context),
              child: TextField(
                controller: name,
                obscureText: false,
                // keyboardType: TextInputType.number,
                // inputFormatters: [
                //   FilteringTextInputFormatter.allow(RegExp('[11234567890.]'))
                // ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 2, context: context),
            ),
            Text(
              "Price",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: Sizer.fontsize(size: 12, context: context)),
            ),
            SizedBox(
              height: Sizer.height(size: .3, context: context),
            ),
            Container(
              // padding: EdgeInsets.only(left: 5.w, right: 5.w),
              height: Sizer.height(size: 5, context: context),
              width: Sizer.width(size: 100, context: context),
              child: TextField(
                controller: price,
                obscureText: false,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[11234567890.]'))
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 2, context: context),
            ),
            Text(
              "Description",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: Sizer.fontsize(size: 12, context: context)),
            ),
            SizedBox(
              height: Sizer.height(size: .3, context: context),
            ),
            Container(
              // padding: EdgeInsets.only(left: 5.w, right: 5.w),
              height: Sizer.height(size: 10, context: context),
              width: Sizer.width(size: 100, context: context),
              child: TextField(
                controller: description,
                obscureText: false,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                // keyboardType: TextInputType.number,
                // inputFormatters: [
                //   FilteringTextInputFormatter.allow(RegExp('[11234567890.]'))
                // ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 1.5, context: context),
            ),
            InkWell(
              onTap: () {
                Get.back();
                controller.uploadServices(
                    servicesID: servicesID,
                    servicesName: name.text,
                    servicesPrice: price.text,
                    servicesDescription: description.text);
              },
              child: Container(
                  height: Sizer.height(context: context, size: 7),
                  width: Sizer.width(context: context, size: 100),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 159, 198, 236),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "UPDATE",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
            ),
          ],
        ),
      ),
    ));
  }

  static showReminderForNotifications(
      {required String patientname,
      required String fcmToken,
      required String service,
      required BuildContext context,
      required WebClinicController controller}) {
    TextEditingController message = TextEditingController();
    message.text =
        "Hi $patientname, Please be reminded that your next visit will be on '*please add time and date here' for $service ";
    Get.dialog(AlertDialog(
      content: Container(
        height: Sizer.height(size: 25, context: context),
        width: Sizer.width(size: 40, context: context),
        child: Column(
          children: [
            Text(
              "Reminder for $patientname",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  fontSize: Sizer.fontsize(size: 12, context: context)),
            ),
            SizedBox(
              height: Sizer.height(size: 2, context: context),
            ),
            Container(
              padding: EdgeInsets.only(
                left: Sizer.width(size: 1, context: context),
                right: Sizer.height(size: 1, context: context),
              ),
              height: Sizer.height(size: 16, context: context),
              width: Sizer.width(size: 40, context: context),
              child: TextField(
                maxLines: 13,
                controller: message,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 1.5),
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Enter reminder for the patient',
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
                width: Sizer.width(size: 40, context: context),
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Get.back();
                      controller.sendNotificationForReminder(
                          userToken: fcmToken, message: message.text);
                      //     userToken: fcmToken,
                      //     service: service,
                      //     message: message.text);
                      // Get.to(() => DentalClinicSubscriptionView());
                    },
                    child: Text(
                      "Notify",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          color: Color.fromARGB(255, 233, 144, 137),
                          fontSize: Sizer.fontsize(size: 12, context: context)),
                    ))),
          ],
        ),
      ),
    ));
  }

  static showDialogAddWalkIn(
      {required WebClinicController controller,
      required BuildContext context}) {
    TextEditingController name = TextEditingController();
    TextEditingController contact = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController address = TextEditingController();
    String resSchedule = "";

    Get.dialog(AlertDialog(
      content: Container(
        height: Sizer.height(size: 80, context: context),
        width: Sizer.width(size: 50, context: context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Sizer.height(size: 1, context: context),
              ),
              Container(
                width: Sizer.width(size: 50, context: context),
                child: Text(
                  "Create walk in transaction",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: Sizer.fontsize(size: 12, context: context),
                      letterSpacing: 1),
                ),
              ),
              SizedBox(
                height: Sizer.height(size: 1, context: context),
              ),
              Container(
                width: Sizer.width(size: 50, context: context),
                child: Text(
                  "Patient name",
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
                  controller: name,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: Sizer.fontsize(size: 12, context: context),
                      letterSpacing: 2),
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(size: 1, context: context),
              ),
              Container(
                width: Sizer.width(size: 50, context: context),
                child: Text(
                  "Patient contact no",
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
                  controller: contact,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: Sizer.fontsize(size: 12, context: context),
                      letterSpacing: 2),
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    if (contact.text.length == 0) {
                    } else {
                      if (contact.text[0] != "9" || contact.text.length > 10) {
                        contact.clear();
                      } else {}
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(size: 1, context: context),
              ),
              Container(
                width: Sizer.width(size: 50, context: context),
                child: Text(
                  "Patient address",
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
                  controller: address,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: Sizer.fontsize(size: 10, context: context),
                      letterSpacing: 2),
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(size: 1, context: context),
              ),
              Container(
                width: Sizer.width(size: 50, context: context),
                child: Text(
                  "Patient email",
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
                  controller: email,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: Sizer.fontsize(size: 10, context: context),
                      letterSpacing: 2),
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(size: 2.5, context: context),
              ),
              Container(
                height: Sizer.height(size: 5, context: context),
                width: Sizer.width(size: 50, context: context),
                padding: EdgeInsets.only(
                    left: Sizer.width(size: 1, context: context),
                    right: Sizer.width(size: 1, context: context)),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6)),
                child: Obx(
                  () => DropdownButton<ServicesList>(
                    value: controller.initialValue.value,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: Sizer.fontsize(size: 10, context: context),
                    elevation: 16,
                    isExpanded: true,
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: Sizer.fontsize(size: 10, context: context)),
                    underline: SizedBox(),
                    onChanged: (ServicesList? value) {
                      controller.initialValue.value = value!;
                      controller.servicesName.value = value.servicesName.value;
                      controller.servicesprice.value = value.servicesPrice;
                    },
                    items: controller.servicesList.map((services) {
                      return DropdownMenuItem(
                        child: Obx(() => Text(services.servicesName.value)),
                        value: services,
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(size: 2.5, context: context),
              ),
              Container(
                  height: Sizer.height(size: 5, context: context),
                  width: Sizer.width(size: 50, context: context),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6)),
                  alignment: Alignment.centerLeft,
                  child:
                      Obx(() => Text("P " + controller.servicesprice.value))),
              SizedBox(
                height: Sizer.height(size: 2, context: context),
              ),
              Container(
                height: Sizer.height(size: 40, context: context),
                width: Sizer.width(size: 50, context: context),
                child: SfDateRangePicker(
                  onSelectionChanged: (args) {
                    // print(args.value.toString());
                    resSchedule = args.value.toString();
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                ),
              ),
              SizedBox(
                height: Sizer.height(size: 2, context: context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: Sizer.height(size: 10, context: context),
                    width: Sizer.width(size: 11, context: context),
                    child: CarouselSlider(
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: Sizer.height(size: 8, context: context),
                          scrollDirection: Axis.vertical),
                      items: controller.hourss.map((hour) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.partialselectedHour.value =
                                      hour.toString();
                                },
                                child: Container(
                                    height:
                                        Sizer.height(size: 8, context: context),
                                    width:
                                        Sizer.width(size: 13, context: context),
                                    decoration: BoxDecoration(
                                        color: controller.partialselectedHour
                                                    .value ==
                                                hour
                                            ? Colors.lightBlue
                                            : Colors.white),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '$hour',
                                      style: TextStyle(
                                          fontSize: Sizer.fontsize(
                                              size: 11, context: context),
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    height: Sizer.height(size: 10, context: context),
                    alignment: Alignment.center,
                    child: Text(
                      " : ",
                      style: TextStyle(
                          fontSize: Sizer.fontsize(size: 15, context: context),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    height: Sizer.height(size: 10, context: context),
                    width: Sizer.width(size: 11, context: context),
                    child: CarouselSlider(
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: Sizer.height(size: 8, context: context),
                          scrollDirection: Axis.vertical),
                      items: controller.minutes.map((minute) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.partialselectedMinutes.value =
                                      minute.toString();
                                },
                                child: Container(
                                    height:
                                        Sizer.height(size: 8, context: context),
                                    width:
                                        Sizer.width(size: 13, context: context),
                                    decoration: BoxDecoration(
                                        color: controller.partialselectedMinutes
                                                    .value ==
                                                minute
                                            ? Colors.lightBlue
                                            : Colors.white),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '$minute',
                                      style: TextStyle(
                                          fontSize: Sizer.fontsize(
                                              size: 13, context: context),
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    width: Sizer.width(size: .5, context: context),
                  ),
                  Container(
                    height: Sizer.height(size: 5, context: context),
                    width: Sizer.width(size: 11, context: context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => InkWell(
                            onTap: () {
                              controller.partialselectedAmPm.value = "AM";
                            },
                            child: Container(
                              alignment: Alignment.center,
                              color:
                                  controller.partialselectedAmPm.value == "AM"
                                      ? Colors.lightBlue
                                      : Colors.white,
                              height: Sizer.height(size: 2, context: context),
                              width: Sizer.width(size: 11, context: context),
                              child: Text(
                                "AM",
                                style: TextStyle(
                                    fontSize: Sizer.fontsize(
                                        size: 11, context: context),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () {
                              controller.partialselectedAmPm.value = "PM";
                            },
                            child: Container(
                              alignment: Alignment.center,
                              color:
                                  controller.partialselectedAmPm.value == "PM"
                                      ? Colors.lightBlue
                                      : Colors.white,
                              height: Sizer.height(size: 2, context: context),
                              width: Sizer.width(size: 11, context: context),
                              child: Text(
                                "PM",
                                style: TextStyle(
                                    fontSize: Sizer.fontsize(
                                        size: 11, context: context),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  if (name.text.isEmpty ||
                      contact.text.isEmpty ||
                      email.text.isEmpty ||
                      resSchedule == "" ||
                      address.text.isEmpty) {
                    Get.snackbar(
                      "Message",
                      "Oops,Missing input",
                      colorText: Colors.white,
                      backgroundColor: Colors.redAccent,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    controller.createWalkinPatientReservation(
                        res_service_name: controller.servicesName.value,
                        res_service_price: controller.servicesprice.value,
                        res_total_amount: controller.servicesprice.value,
                        res_schedule: resSchedule,
                        res_schedule_time:
                            controller.partialselectedHour.value +
                                ":" +
                                controller.partialselectedMinutes.value +
                                " " +
                                controller.partialselectedAmPm.value,
                        res_walkin_client_name: name.text);
                    // controller.createWalkin(
                    //     patient_name: name.text,
                    //     service_name: controller.servicesName.value,
                    //     service_price: controller.servicesprice.value,
                    //     contactno: contact.text,
                    //     email: email.text,
                    //     address: address.text);
                  }
                },
                child: Container(
                  height: Sizer.height(size: 5, context: context),
                  width: Sizer.width(size: 50, context: context),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 130, 191, 240),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black54)),
                  alignment: Alignment.center,
                  child: Text(
                    "CREATE",
                    style: TextStyle(
                      letterSpacing: 4,
                      fontSize: Sizer.fontsize(size: 12, context: context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(size: 2, context: context),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  static showCreateDentist(
      {required WebClinicController controller,
      required BuildContext context}) {
    TextEditingController name = TextEditingController();
    TextEditingController contact = TextEditingController();
    TextEditingController email = TextEditingController();
    Get.dialog(AlertDialog(
      content: Container(
        height: Sizer.height(size: 70, context: context),
        width: Sizer.width(size: 35, context: context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              width: Sizer.width(size: 50, context: context),
              child: Text(
                "Dentist Registration",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 1),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              width: Sizer.width(size: 50, context: context),
              child: Text(
                "Dentist name",
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
                controller: name,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 2),
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              width: Sizer.width(size: 50, context: context),
              child: Text(
                "Dentist contact no",
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
                controller: contact,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 2),
                obscureText: false,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  if (contact.text.length == 0) {
                  } else {
                    if (contact.text[0] != "9" || contact.text.length > 10) {
                      contact.clear();
                    } else {}
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              width: Sizer.width(size: 50, context: context),
              child: Text(
                "Dentist email",
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
                controller: email,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 10, context: context),
                    letterSpacing: 2),
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 4, context: context),
            ),
            Container(
              height: Sizer.height(size: 5, context: context),
              width: Sizer.width(size: 50, context: context),
              padding: EdgeInsets.only(
                  left: Sizer.width(size: 1, context: context),
                  right: Sizer.width(size: 1, context: context)),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6)),
              child: Obx(
                () => DropdownButton<String>(
                  value: controller.initialPosition.value,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: Sizer.fontsize(size: 10, context: context),
                  elevation: 16,
                  isExpanded: true,
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: Sizer.fontsize(size: 10, context: context)),
                  underline: SizedBox(),
                  onChanged: (String? value) {
                    controller.initialPosition.value = value!;
                  },
                  items: controller.listofPositions.map((position) {
                    return DropdownMenuItem<String>(
                      child: Text(position),
                      value: position!,
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 2, context: context),
            ),
            Container(
              width: Sizer.width(size: 50, context: context),
              child: Text(
                "Valid ID",
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
                                image:
                                    NetworkImage(controller.imagePath.value))),
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
              height: Sizer.height(size: 4, context: context),
            ),
            //
            InkWell(
              onTap: () {
                if (name.text.isEmpty ||
                    contact.text.isEmpty ||
                    email.text.isEmpty) {
                  Get.snackbar(
                    "Message",
                    "Oops, Missing input",
                    colorText: Colors.white,
                    backgroundColor: Colors.redAccent,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else if (controller.imagePath.value == '') {
                  Get.snackbar(
                    "Message",
                    "Please select an image",
                    colorText: Colors.white,
                    backgroundColor: Colors.redAccent,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  controller.createDentist(
                      positioned: controller.initialPosition.value,
                      dentist_name: name.text,
                      dentist_contact: contact.text,
                      dentist_email: email.text);
                }
              },
              child: Container(
                height: Sizer.height(size: 5, context: context),
                width: Sizer.width(size: 50, context: context),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 130, 191, 240),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black54)),
                alignment: Alignment.center,
                child: Text(
                  "CREATE",
                  style: TextStyle(
                    letterSpacing: 4,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 2, context: context),
            ),
          ],
        ),
      ),
    ));
  }

  static showCreateServices(
      {required WebClinicController controller,
      required BuildContext context}) {
    TextEditingController name = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController description = TextEditingController();
    Get.dialog(AlertDialog(
      content: Container(
        height: Sizer.height(size: 45, context: context),
        width: Sizer.width(size: 35, context: context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              width: Sizer.width(size: 50, context: context),
              child: Text(
                "Services Registration",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 1),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              width: Sizer.width(size: 50, context: context),
              child: Text(
                "Services name",
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
                controller: name,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 2),
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              width: Sizer.width(size: 50, context: context),
              child: Text(
                "Services Price",
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
                controller: price,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 2),
                obscureText: false,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[11234567890.]'))
                ],
                // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // onChanged: (value) {
                //   if (contact.text.length == 0) {
                //   } else {
                //     if (contact.text[0] != "9" || contact.text.length > 10) {
                //       contact.clear();
                //     } else {}
                //   }
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              width: Sizer.width(size: 50, context: context),
              child: Text(
                "Services Description",
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
                controller: description,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 10, context: context),
                    letterSpacing: 2),
                obscureText: false,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 4, context: context),
            ),
            InkWell(
              onTap: () {
                if (name.text.isEmpty ||
                    price.text.isEmpty ||
                    description.text.isEmpty) {
                  Get.snackbar(
                    "Message",
                    "Oops, Missing input",
                    colorText: Colors.white,
                    backgroundColor: Colors.redAccent,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  controller.createService(
                      services_name: name.text,
                      services_price: price.text,
                      services_description: description.text);
                }
              },
              child: Container(
                height: Sizer.height(size: 5, context: context),
                width: Sizer.width(size: 50, context: context),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 130, 191, 240),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black54)),
                alignment: Alignment.center,
                child: Text(
                  "CREATE",
                  style: TextStyle(
                    letterSpacing: 4,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 2, context: context),
            ),
          ],
        ),
      ),
    ));
  }

  static showCreateRemarks(
      {required WebClinicController controller,
      required String patientname,
      required String clientID,
      required BuildContext context}) {
    TextEditingController remarks = TextEditingController();

    Get.dialog(AlertDialog(
      content: Container(
        height: Sizer.height(size: 45, context: context),
        width: Sizer.width(size: 35, context: context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              width: Sizer.width(size: 50, context: context),
              child: Text(
                "Create remarks for $patientname",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    letterSpacing: 1),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
              width: Sizer.width(size: 50, context: context),
              child: Text(
                "Remarks",
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
              height: Sizer.height(size: 25, context: context),
              width: Sizer.width(size: 50, context: context),
              child: TextField(
                controller: remarks,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Sizer.fontsize(size: 10, context: context),
                    letterSpacing: 2),
                obscureText: false,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            InkWell(
              onTap: () {
                if (remarks.text.isEmpty) {
                  Get.snackbar(
                    "Message",
                    "Oops, Please add some remarks for the client.",
                    colorText: Colors.white,
                    backgroundColor: Colors.redAccent,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  controller.createRemarks(
                    clientID: clientID,
                    remarks: remarks.text,
                  );
                }
              },
              child: Container(
                height: Sizer.height(size: 5, context: context),
                width: Sizer.width(size: 50, context: context),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 130, 191, 240),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black54)),
                alignment: Alignment.center,
                child: Text(
                  "CREATE",
                  style: TextStyle(
                    letterSpacing: 4,
                    fontSize: Sizer.fontsize(size: 12, context: context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.height(size: 2, context: context),
            ),
          ],
        ),
      ),
    ));
  }

  static showCreateNotifSchedule(
      {required BuildContext context,
      required WebClinicController controller}) {
    var notificationSchedule = "";
    Get.dialog(
      AlertDialog(
        content: Container(
          height: Sizer.height(size: 65, context: context),
          width: Sizer.width(size: 80, context: context),
          child: Column(
            children: [
              Text(
                "Revisit Schedule",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Sizer.fontsize(size: 22, context: context),
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: Sizer.height(size: 3, context: context),
              ),
              Container(
                height: Sizer.height(size: 40, context: context),
                width: Sizer.width(size: 50, context: context),
                child: SfDateRangePicker(
                  onSelectionChanged: (args) {
                    // print(args.value.toString());
                    notificationSchedule = args.value.toString();
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                ),
              ),
              SizedBox(
                height: Sizer.height(size: 1, context: context),
              ),
              Obx(
                () => controller.isCreatingSchedule.value == false
                    ? InkWell(
                        onTap: () async {
                          print(notificationSchedule);
                          controller.isCreatingSchedule(true);
                          await controller.createClientNotificationSchedule(
                              client_name: controller.selectedClient.value,
                              client_id: controller.selectedClientID.value,
                              notif_schedule: notificationSchedule,
                              fcmToken: controller.selectedFCMtoken.value);
                          controller.isCreatingSchedule(false);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: Sizer.height(size: 5, context: context),
                          width: Sizer.width(size: 50, context: context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromARGB(255, 126, 164, 230)),
                          child: Text("CREATE"),
                        ),
                      )
                    : Container(
                        alignment: Alignment.center,
                        height: Sizer.height(size: 5, context: context),
                        width: Sizer.width(size: 50, context: context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromARGB(255, 126, 164, 230)),
                        child: Padding(
                          padding: EdgeInsets.all(
                              Sizer.width(size: .2, context: context)),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(
                height: Sizer.height(size: 1, context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static showDatePickerRange(
      {required BuildContext context,
      required WebClinicController controller}) {
    DateTime? startDate;
    DateTime? endDate;
    Get.dialog(
      AlertDialog(
        content: Container(
          height: Sizer.height(size: 65, context: context),
          width: Sizer.width(size: 80, context: context),
          child: Column(
            children: [
              Text(
                "Select Range",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Sizer.fontsize(size: 22, context: context),
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: Sizer.height(size: 3, context: context),
              ),
              Container(
                height: Sizer.height(size: 40, context: context),
                width: Sizer.width(size: 50, context: context),
                child: SfDateRangePicker(
                  onSelectionChanged: (args) async {
                    print(args.value);
                    if (args.value.startDate != null) {
                      startDate = await args.value.startDate;
                    }
                    if (args.value.endDate != null) {
                      endDate = await args.value.endDate;
                    }
                    print(startDate);
                    print(endDate);
                    // pickRange = args.value.toString();
                  },
                  selectionMode: DateRangePickerSelectionMode.range,
                ),
              ),
              SizedBox(
                height: Sizer.height(size: 1, context: context),
              ),
              InkWell(
                onTap: () async {
                  Get.back();
                  if (startDate != null && endDate != null) {
                    controller.filterRange(
                        startDate: startDate!.subtract(Duration(days: 1)),
                        endDate: endDate!.add(Duration(days: 1)));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: Sizer.height(size: 5, context: context),
                  width: Sizer.width(size: 50, context: context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 126, 164, 230)),
                  child: Text("SELECT"),
                ),
              ),
              SizedBox(
                height: Sizer.height(size: 1, context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static showReminder({
    required BuildContext context,
  }) {
    Get.dialog(AlertDialog(
      content: Container(
        height: Sizer.height(size: 14, context: context),
        width: Sizer.width(size: 20, context: context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reminder",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  fontSize: Sizer.fontsize(size: 15, context: context)),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Text(
              "Your dental account is currently inactive.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  fontSize: Sizer.fontsize(size: 11, context: context)),
            ),
            Text(
              "Please subscribe to our system. ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  fontSize: Sizer.fontsize(size: 11, context: context)),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Container(
                width: Sizer.width(size: 20, context: context),
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Get.back();
                      Future.delayed(Duration(seconds: 1), () {
                        showSubscriptionScreen(
                          context: context,
                        );
                      });
                    },
                    child: Text(
                      "Subscribe now!",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          color: Colors.red,
                          fontSize: Sizer.fontsize(size: 12, context: context)),
                    ))),
          ],
        ),
      ),
    ));
  }

  static showSubscriptionScreen({
    required BuildContext context,
  }) {
    Get.dialog(AlertDialog(
      content: Container(
        color: Colors.white,
        height: Sizer.height(size: 35, context: context),
        width: Sizer.width(size: 20, context: context),
        child: Column(
          children: [
            Text(
              "Subscription",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  fontSize: Sizer.fontsize(size: 15, context: context)),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            Text(
              "Activate your account.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  fontSize: Sizer.fontsize(size: 11, context: context)),
            ),
            Text(
              "Please select payment option. ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  fontSize: Sizer.fontsize(size: 11, context: context)),
            ),
            SizedBox(
              height: Sizer.height(size: 1, context: context),
            ),
            SizedBox(
              height: Sizer.height(size: 2, context: context),
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                      value: Get.find<WebClinicController>().isCheckGcash.value,
                      onChanged: (value) {
                        if (Get.find<WebClinicController>()
                                .isCheckGcash
                                .value ==
                            true) {
                          Get.find<WebClinicController>().isCheckGcash.value =
                              false;
                          Get.find<WebClinicController>()
                              .isSelectedPaymentGateway
                              .value = "";
                        } else {
                          Get.find<WebClinicController>().isCheckGcash.value =
                              true;
                          Get.find<WebClinicController>()
                              .isSelectedPaymentGateway
                              .value = "Gcash";
                        }
                        Get.find<WebClinicController>().isPaymaya.value = false;
                      }),
                ),
                Container(
                  height: Sizer.height(size: 10, context: context),
                  child: Image.asset("assets/images/gcashlogo.png"),
                )
              ],
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                      value: Get.find<WebClinicController>().isPaymaya.value,
                      onChanged: (value) {
                        if (Get.find<WebClinicController>().isPaymaya.value ==
                            true) {
                          Get.find<WebClinicController>().isPaymaya.value =
                              false;
                          Get.find<WebClinicController>()
                              .isSelectedPaymentGateway
                              .value = "";
                        } else {
                          Get.find<WebClinicController>().isPaymaya.value =
                              true;
                          Get.find<WebClinicController>()
                              .isSelectedPaymentGateway
                              .value = "Paymaya";
                        }
                        Get.find<WebClinicController>().isCheckGcash.value =
                            false;
                      }),
                ),
                SizedBox(
                  width: Sizer.width(size: 1.5, context: context),
                ),
                Container(
                  height: Sizer.height(size: 10, context: context),
                  child: Image.asset("assets/images/paymaya.png"),
                ),
              ],
            ),
            Container(
                width: Sizer.width(size: 20, context: context),
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      if (Get.find<WebClinicController>().isCheckGcash.value ==
                              false &&
                          Get.find<WebClinicController>().isPaymaya.value ==
                              false) {
                        Get.snackbar(
                            "Message", "Please Select a Payment Options",
                            colorText: Colors.white,
                            backgroundColor: Color.fromARGB(255, 136, 205, 236),
                            snackPosition: SnackPosition.TOP,
                            duration: Duration(seconds: 3));
                      } else {
                        Get.find<WebClinicController>()
                            .updateClinicSubscription();
                      }
                    },
                    child: Text(
                      "Subscribe now!",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          color: Colors.red,
                          fontSize: Sizer.fontsize(size: 12, context: context)),
                    ))),
          ],
        ),
      ),
    ));
  }
}
