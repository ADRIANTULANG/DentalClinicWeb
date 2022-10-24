import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/class_sizer.dart';
import '../controller/web_clinic_home_controller.dart';

class Accesslog extends GetView<WebClinicController> {
  const Accesslog();

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
                "Logs",
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
                  "Patient",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: Sizer.width(size: 5, context: context),
                child: Text(
                  "Adress",
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
                  "Contact no",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              // Container(
              //   width: Sizer.width(size: 5, context: context),
              //   child: Text(
              //     "Date",
              //     style: TextStyle(fontWeight: FontWeight.w500),
              //   ),
              // ),
              // Container(
              //   width: Sizer.width(size: 10, context: context),
              //   child: Text(
              //     "Service",
              //     style: TextStyle(fontWeight: FontWeight.w500),
              //   ),
              // ),
              // Container(
              //   width: Sizer.width(size: 5, context: context),
              //   child: Text(
              //     "Price",
              //     style: TextStyle(fontWeight: FontWeight.w500),
              //   ),
              // ),
              // SizedBox(
              //   child: Row(
              //     children: [
              //       Text(
              //         "Total",
              //         style: TextStyle(fontWeight: FontWeight.w500),
              //       ),
              //       SizedBox(
              //         width: Sizer.width(size: .5, context: context),
              //       ),
              //       Obx(
              //         () => Text(
              //           "P ${controller.totalwalkinAmount.value}",
              //           style: TextStyle(
              //               fontWeight: FontWeight.w500, color: Colors.red),
              //         ),
              //       ),
              //     ],
              //   ),
              // )
              SizedBox(
                width: Sizer.width(size: 4, context: context),
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
                itemCount: controller.acccessLogsList.length,
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
                            controller.acccessLogsList[index].clientName,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 5, context: context),
                          child: Text(
                            controller.acccessLogsList[index].clientAddress,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 5, context: context),
                          child: Text(
                            controller.acccessLogsList[index].clientEmail,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: Sizer.width(size: 5, context: context),
                          child: Text(
                            controller.acccessLogsList[index].clientContactNo,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          width: Sizer.width(size: 4, context: context),
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
