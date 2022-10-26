import 'package:dentalclinic/pages/web_clinic_home/dialog/web_clinic_home_dialog.dart';
import 'package:dentalclinic/pages/web_clinic_home/widgets/records.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../configs/class_sizer.dart';
import '../controller/web_clinic_home_controller.dart';

class Patient extends GetView<WebClinicController> {
  const Patient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: Sizer.width(size: 1, context: context),
            right: Sizer.width(size: 1, context: context)),
        child: Column(children: [
          SizedBox(
            height: Sizer.height(size: 3, context: context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Patients",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Sizer.fontsize(size: 20, context: context),
                    letterSpacing: 2),
              ),
              Row(
                children: [
                  Obx(() => controller.isLoadingRefresh.value == false
                      ? InkWell(
                          onTap: () async {
                            controller.isLoadingRefresh.value = true;
                            await controller.onRefresh();
                            controller.isLoadingRefresh.value = false;
                          },
                          child: Container(
                              padding: EdgeInsets.all(
                                  Sizer.width(size: .3, context: context)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromARGB(255, 146, 192, 230)),
                              child: Icon(Icons.refresh_rounded)),
                        )
                      : SizedBox()),
                  SizedBox(
                    width: Sizer.width(size: 1, context: context),
                  ),
                  InkWell(
                    onTap: () {
                      WebClinicHomeDialog.showDialogAddWalkIn(
                          controller: controller, context: context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                          Sizer.width(size: .3, context: context)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromARGB(255, 146, 192, 230)),
                      child: Text(
                        "CREATE",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize:
                                Sizer.fontsize(size: 15, context: context),
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Sizer.height(size: 3, context: context),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Sizer.width(size: 5, context: context),
                child: Text(
                  "Service",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: Sizer.width(size: 10, context: context),
                child: Text(
                  "Patient",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: Sizer.width(size: 5, context: context),
                child: Text(
                  "Date",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: Sizer.width(size: 5, context: context),
                child: Text(
                  "Total payment",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: Sizer.width(size: 6, context: context),
              ),
            ],
          ),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Divider(),
          SizedBox(
            height: Sizer.height(size: 1, context: context),
          ),
          Expanded(
              child: Container(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.approveList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: Sizer.height(size: 1, context: context)),
                    child: InkWell(
                      onTap: () async {
                        if (controller.approveList[index].resType! ==
                            "isWalkin") {
                        } else {
                          await controller.getClientRemarks(
                              clientID:
                                  controller.approveList[index].resClientId!);
                          controller.selectedClient.value =
                              controller.approveList[index].clientName!;
                          controller.selectedClientID.value =
                              controller.approveList[index].resClientId!;
                          controller.selectedFCMtoken.value =
                              controller.approveList[index].fcmToken!;
                          Get.to(() => Records());
                        }
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Sizer.width(size: 5, context: context),
                            child: Text(
                              controller.approveList[index].resServiceName!,
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            width: Sizer.width(size: 10, context: context),
                            child: Text(
                              controller.approveList[index].resType! ==
                                      "isWalkin"
                                  ? controller.approveList[index].resWalkinName!
                                  : controller.approveList[index].clientName!,
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            width: Sizer.width(size: 5, context: context),
                            child: Text(
                              DateFormat.yMMMEd().format(controller
                                      .approveList[index].resSchedule) +
                                  " " +
                                  controller
                                      .approveList[index].resScheduleTime!,
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            width: Sizer.width(size: 5, context: context),
                            child: Text(
                              "P " +
                                  controller.approveList[index].resTotalAmount!,
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ),
                          Row(
                            children: [
                              controller.approveList[index].resType! ==
                                      "isWalkin"
                                  ? SizedBox(
                                      width: Sizer.width(
                                          size: 1.7, context: context),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        WebClinicHomeDialog
                                            .showReminderForNotifications(
                                                patientname: controller
                                                    .approveList[index]
                                                    .clientName!,
                                                fcmToken: controller
                                                    .approveList[index]
                                                    .fcmToken!,
                                                service: controller
                                                    .approveList[index]
                                                    .resServiceName!,
                                                context: context,
                                                controller: controller);
                                      },
                                      icon: Icon(
                                        Icons.notifications_active,
                                        color:
                                            Color.fromARGB(255, 240, 167, 162),
                                      )),
                              SizedBox(
                                width: Sizer.width(size: .5, context: context),
                              ),
                              // IconButton(
                              //     onPressed: () {
                              //       controller.updateAppointmentStatus(
                              //           resID: controller
                              //               .homeApproveList[index].resId,
                              //           remarks: "",
                              //           status: "Approved");
                              //       controller.sendNotification(
                              //           userToken: controller
                              //               .pendingList[index].fcmToken,
                              //           service: controller
                              //               .pendingList[index].resServiceName,
                              //           date: DateFormat.yMMMEd().format(
                              //               controller
                              //                   .pendingList[index].resSchedule),
                              //           time: controller
                              //               .pendingList[index].resScheduleTime,
                              //           clinic: Get.find<StorageServices>()
                              //               .storage
                              //               .read('clinicName'),
                              //           status: "APPROVED");
                              //     },
                              //     icon: Icon(
                              //       Icons.done,
                              //       color: Color.fromARGB(255, 140, 194, 238),
                              //     )),
                              SizedBox(
                                width: Sizer.width(size: 1, context: context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ))
        ]),
      ),
    );
  }
}
