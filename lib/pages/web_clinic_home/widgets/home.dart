import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../configs/class_sizer.dart';
import '../controller/web_clinic_home_controller.dart';

class Home extends GetView<WebClinicController> {
  const Home();

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
                "Home",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Sizer.fontsize(size: 20, context: context),
                    letterSpacing: 2),
              ),
              Obx(
                () => PopupMenuButton(
                  child: Container(
                    padding:
                        EdgeInsets.all(Sizer.width(size: .3, context: context)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 146, 192, 230)),
                    child: Text(
                      controller.selectedMonth.value,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: Sizer.fontsize(size: 15, context: context),
                          letterSpacing: 2),
                    ),
                  ),
                  itemBuilder: (context) => controller.months
                      .map((element) => PopupMenuItem<String>(
                            onTap: () {
                              controller.selectedMonth.value = element;
                              for (var i = 0;
                                  i < controller.months.length;
                                  i++) {
                                if (controller.months[i] == element) {
                                  controller.filterMonth(month: i);
                                }
                              }
                            },
                            value: element,
                            child: Text(
                              element,
                            ),
                          ))
                      .toList(),
                ),
              )
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
                  "ID",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: Sizer.width(size: 10, context: context),
                child: Text(
                  "Services",
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
                  "Price",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: Sizer.width(size: .5, context: context),
                    ),
                    Obx(
                      () => Text(
                        "P ${controller.totalAmount.value}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.red),
                      ),
                    ),
                  ],
                ),
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
                itemCount: controller.homeApproveList.length,
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
                            controller.homeApproveList[index].resId,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 10, context: context),
                          child: Text(
                            controller.homeApproveList[index].resServiceName,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 5, context: context),
                          child: Text(
                            DateFormat.yMMMEd().format(controller
                                    .homeApproveList[index].resSchedule) +
                                " " +
                                controller
                                    .homeApproveList[index].resScheduleTime,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 5, context: context),
                          child: Text(
                            "P " +
                                controller
                                    .homeApproveList[index].resServicePrice,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          width: Sizer.width(size: 5, context: context),
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
