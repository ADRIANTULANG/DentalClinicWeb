import 'package:dentalclinic/pages/web_clinic_home/dialog/web_clinic_home_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../configs/class_sizer.dart';
import '../controller/web_clinic_home_controller.dart';

class NotificationScheduleView extends GetView<WebClinicController> {
  const NotificationScheduleView();

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
                "Revisit Schedule",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Sizer.fontsize(size: 20, context: context),
                    letterSpacing: 2),
              ),
              InkWell(
                onTap: () async {
                  WebClinicHomeDialog.showCreateNotifSchedule(
                      context: context, controller: controller);
                },
                child: Container(
                    padding:
                        EdgeInsets.all(Sizer.width(size: .3, context: context)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 146, 192, 230)),
                    child: Text("CREATE")),
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
                  "Client ID",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: Sizer.width(size: 10, context: context),
                child: Text(
                  "Client name",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: Sizer.width(size: 5, context: context),
                child: Text(
                  "Revisit Schedule",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: Sizer.width(size: 5, context: context),
                child: Text(
                  "Notified",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: Sizer.width(size: 6, context: context),
              )
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
                itemCount: controller.client_notificationSchedule.length,
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
                            controller
                                .client_notificationSchedule[index].clientId,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 10, context: context),
                          child: Text(
                            controller
                                .client_notificationSchedule[index].clientName,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 5, context: context),
                          child: Text(
                            DateFormat.yMMMEd().format(controller
                                .client_notificationSchedule[index]
                                .notifSchedule),
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 5, context: context),
                          child: Text(
                            controller
                                .client_notificationSchedule[index].isNotified,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          width: Sizer.width(size: 6, context: context),
                        )
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
