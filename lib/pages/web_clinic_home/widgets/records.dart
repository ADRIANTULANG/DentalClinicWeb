import 'package:dentalclinic/pages/web_clinic_home/dialog/web_clinic_home_dialog.dart';
import 'package:dentalclinic/pages/web_clinic_home/widgets/notification_schedule_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../configs/class_sizer.dart';
import '../controller/web_clinic_home_controller.dart';

class Records extends GetView<WebClinicController> {
  const Records();

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
              Obx(
                () => Text(
                  "Records of ${controller.selectedClient.value}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: Sizer.fontsize(size: 20, context: context),
                      letterSpacing: 2),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      await controller.getClientNotificationSchedule(
                          clientID: controller.selectedClientID.value);
                      Get.to(() => NotificationScheduleView());
                    },
                    child: Container(
                        padding: EdgeInsets.all(
                            Sizer.width(size: .3, context: context)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 146, 192, 230)),
                        child: Text(
                          "Schedule",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize:
                                  Sizer.fontsize(size: 15, context: context),
                              letterSpacing: 2),
                        )),
                  ),
                  SizedBox(
                    width: Sizer.width(size: 1, context: context),
                  ),
                  Obx(() => controller.isLoadingRefresh.value == false
                      ? InkWell(
                          onTap: () async {
                            controller.isLoadingRefresh.value = true;
                            await controller.onRefreshRecord();
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
                      controller.sendNotificationRequest();
                    },
                    child: Container(
                        padding: EdgeInsets.all(
                            Sizer.width(size: .3, context: context)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 146, 192, 230)),
                        child: Icon(Icons.notifications_active_rounded)),
                  ),
                  SizedBox(
                    width: Sizer.width(size: 1, context: context),
                  ),
                  InkWell(
                    onTap: () {
                      WebClinicHomeDialog.showCreateRemarks(
                          controller: controller,
                          context: context,
                          patientname: controller.selectedClient.value,
                          clientID: controller.selectedClientID.value);
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
                  "Clinic",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: Sizer.width(size: 5, context: context),
                child: Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: Sizer.width(size: 5, context: context),
                child: Text(
                  "Contact",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: Sizer.width(size: 10, context: context),
                child: Text(
                  "Remarks",
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
                itemCount: controller.remarksList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: Sizer.height(size: 1, context: context)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Sizer.width(size: 5, context: context),
                          child: Text(
                            controller.remarksList[index].clinicName,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 5, context: context),
                          child: Text(
                            controller.remarksList[index].clinicEmail,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 5, context: context),
                          child: Text(
                            controller.remarksList[index].clinicContactNo,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 10, context: context),
                          child: Text(
                            controller.remarksList[index].remarks,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 5, context: context),
                          child: Text(
                            DateFormat.yMMMEd().format(
                                controller.remarksList[index].createdAt),
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
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
