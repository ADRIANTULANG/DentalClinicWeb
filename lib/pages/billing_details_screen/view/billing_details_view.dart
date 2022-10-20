import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../configs/class_sizer.dart';
import '../controller/billing_details_controller.dart';

class BillingDetailsView extends GetView<BillingDetailsController> {
  const BillingDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BillingDetailsController());
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                  left: Sizer.width(context: context, size: 1.5),
                  top: Sizer.height(context: context, size: 3)),
              width: Sizer.width(context: context, size: 100),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_outlined)),
                  SizedBox(
                    width: Sizer.width(context: context, size: .5),
                  ),
                  Obx(
                    () => controller.isRefreshing.value == true
                        ? SizedBox()
                        : IconButton(
                            onPressed: () async {
                              controller.isRefreshing(true);
                              await controller.getClinicBillingDetails(
                                  clinicID: controller.clinicID.value);
                              controller.isRefreshing(false);
                            },
                            icon: Icon(Icons.refresh_rounded)),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: Sizer.width(context: context, size: 1.5),
                  right: Sizer.width(context: context, size: 1.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Sizer.width(context: context, size: 60),
                    height: Sizer.height(context: context, size: 25),
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: Sizer.width(context: context, size: 1),
                          ),
                          child: Obx(
                            () => Text(
                              controller.clinicName.value,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizer.fontsize(
                                      context: context, size: 35),
                                  letterSpacing: 3),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //     left: Sizer.width(context: context, size: 1.1),
                        //   ),
                        //   child: Obx(
                        //     () => Text(
                        //       controller.clinicDentist.value,
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.w600,
                        //           fontSize: Sizer.fontsize(
                        //               context: context, size: 20),
                        //           letterSpacing: 2),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: Sizer.height(context: context, size: 2),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Sizer.width(context: context, size: 1.1),
                          ),
                          child: Obx(
                            () => Text(
                              controller.clinicAddress.value,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizer.fontsize(
                                      context: context, size: 20),
                                  letterSpacing: 2),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Sizer.width(context: context, size: 1.1),
                          ),
                          child: Obx(
                            () => Text(
                              controller.clinicContact.value,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizer.fontsize(
                                      context: context, size: 20),
                                  letterSpacing: 2),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Sizer.width(context: context, size: 1.1),
                          ),
                          child: Obx(
                            () => Text(
                              controller.clinicEmail.value,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizer.fontsize(
                                      context: context, size: 20),
                                  letterSpacing: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Sizer.width(context: context, size: 25),
                    height: Sizer.height(context: context, size: 25),
                    alignment: Alignment.centerRight,
                    // color: Colors.red,
                    child: Image.asset("assets/images/loginimage.png"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Sizer.height(context: context, size: 3),
            ),
            Container(
              width: Sizer.width(context: context, size: 100),
              padding: EdgeInsets.only(
                  left: Sizer.width(context: context, size: 2.5),
                  right: Sizer.width(context: context, size: 2.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subscription Details",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizer.fontsize(context: context, size: 25),
                        letterSpacing: 2),
                  ),
                  Row(
                    children: [
                      Text(
                        "Total: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize:
                                Sizer.fontsize(context: context, size: 25),
                            letterSpacing: 2),
                      ),
                      Obx(
                        () => Text(
                          "P ${controller.clinicTotalPayment.value}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                              fontSize:
                                  Sizer.fontsize(context: context, size: 25),
                              letterSpacing: 2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: Sizer.height(context: context, size: 1),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Sizer.width(context: context, size: 2.5),
                  right: Sizer.width(context: context, size: 10)),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Sizer.width(context: context, size: 16),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Subscription ID",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizer.fontsize(context: context, size: 20),
                          letterSpacing: 2),
                    ),
                  ),
                  Container(
                    width: Sizer.width(context: context, size: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Subscription Date",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizer.fontsize(context: context, size: 20),
                          letterSpacing: 2),
                    ),
                  ),
                  Container(
                    width: Sizer.width(context: context, size: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Expiration Date",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizer.fontsize(context: context, size: 20),
                          letterSpacing: 2),
                    ),
                  ),
                  Container(
                    width: Sizer.width(context: context, size: 16),
                    alignment: Alignment.centerLeft,
                    // color: Colors.red,
                    child: Text(
                      "Amount",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizer.fontsize(context: context, size: 20),
                          letterSpacing: 2),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Sizer.height(context: context, size: 1),
            ),
            Divider(),
            Expanded(
              child: Container(
                child: Obx(
                  () => controller.isLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.lightBlueAccent,
                          ),
                        )
                      : Obx(
                          () => controller.clinicDateList.length == 0
                              ? Center(
                                  child: Text(
                                    "Sorry.. No available Data",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: Sizer.fontsize(
                                            context: context, size: 20),
                                        letterSpacing: 2),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: controller.clinicDateList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: Sizer.width(
                                              context: context, size: 2.5),
                                          bottom: Sizer.height(
                                              context: context, size: 1),
                                          right: Sizer.width(
                                              context: context, size: 10)),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: Sizer.width(
                                                context: context, size: 16),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              controller
                                                  .clinicDateList[index].subsId,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: Sizer.fontsize(
                                                      context: context,
                                                      size: 20),
                                                  letterSpacing: 2),
                                            ),
                                          ),
                                          Container(
                                            width: Sizer.width(
                                                context: context, size: 20),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              DateFormat.yMMMMd()
                                                  .format(controller
                                                      .clinicDateList[index]
                                                      .subsPurchasedDate)
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: Sizer.fontsize(
                                                      context: context,
                                                      size: 20),
                                                  letterSpacing: 2),
                                            ),
                                          ),
                                          Container(
                                            width: Sizer.width(
                                                context: context, size: 20),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              DateFormat.yMMMMd()
                                                  .format(controller
                                                      .clinicDateList[index]
                                                      .subsExpirationDate)
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: Sizer.fontsize(
                                                      context: context,
                                                      size: 20),
                                                  letterSpacing: 2),
                                            ),
                                          ),
                                          Container(
                                            // color: Colors.red,
                                            width: Sizer.width(
                                                context: context, size: 16),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "P " +
                                                  controller
                                                      .clinicDateList[index]
                                                      .subsAmount,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: Sizer.fontsize(
                                                      context: context,
                                                      size: 20),
                                                  letterSpacing: 2),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
