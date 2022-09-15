import 'package:dentalclinic/pages/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/class_sizer.dart';
import '../../billing_details_screen/view/billing_details_view.dart';

class DashboardBillingMonitoringView extends GetView<DashboardController> {
  const DashboardBillingMonitoringView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Sizer.width(context: context, size: 2),
        right: Sizer.width(context: context, size: 2),
      ),
      child: Container(
          width: Sizer.width(context: context, size: 100),
          height: Sizer.height(context: context, size: 77),
          padding: EdgeInsets.only(
            left: Sizer.width(context: context, size: 2),
            right: Sizer.width(context: context, size: 2),
            top: Sizer.width(context: context, size: 2),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 10)
              ],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              Container(
                width: Sizer.width(context: context, size: 100),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Billing Monitoring",
                      style: TextStyle(
                          letterSpacing: 2,
                          fontWeight: FontWeight.w700,
                          fontSize: Sizer.fontsize(context: context, size: 25)),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Balance: ",
                            style: TextStyle(
                                letterSpacing: 2,
                                fontWeight: FontWeight.w500,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 25)),
                          ),
                          Obx(
                            () => Text(
                              "P" +
                                  controller.totalBalance.value
                                      .toStringAsFixed(2),
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Sizer.fontsize(
                                      context: context, size: 25)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Sizer.height(context: context, size: 2),
              ),
              Container(
                height: Sizer.height(context: context, size: 6),
                width: Sizer.width(context: context, size: 100),
                child: TextField(
                  controller: controller.clinicSubscribeEditing,
                  obscureText: false,
                  onChanged: (value) {
                    controller.searchSubscribeClinic(
                        value: controller.clinicSubscribeEditing.text);
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.clinicSubscribeEditing.clear();
                            FocusScope.of(context).unfocus();
                            controller.clinic_subscribe_list.assignAll(
                                controller.clinic_subscribe_masterList);
                          },
                          icon: Icon(Icons.clear)),
                      contentPadding: EdgeInsets.only(
                          bottom: Sizer.height(context: context, size: 1),
                          left: Sizer.width(context: context, size: 1)),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Search Clinic',
                      // hintText: 'Enter Clinic Name',
                      hintStyle: TextStyle(
                          fontSize: Sizer.fontsize(context: context, size: 9)),
                      labelStyle: TextStyle(
                          fontSize: Sizer.fontsize(context: context, size: 9))),
                ),
              ),
              SizedBox(
                height: Sizer.height(context: context, size: 2),
              ),
              Divider(),
              SizedBox(
                height: Sizer.height(context: context, size: 2),
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Clinic ID",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Clinic Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Clinic Address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Amount",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                ],
              ),
              SizedBox(
                height: Sizer.height(context: context, size: 2),
              ),
              Divider(),
              SizedBox(
                height: Sizer.height(context: context, size: 2),
              ),
              Expanded(
                  child: Container(
                child: Obx(
                  () => ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: controller.clinic_subscribe_list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: Sizer.height(context: context, size: 3)),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => BillingDetailsView(), arguments: {
                              "clinicID": controller
                                  .clinic_subscribe_list[index].clinicId,
                              'clinicName': controller
                                  .clinic_subscribe_list[index].clinicName,
                              'clinicDentist': controller
                                  .clinic_subscribe_list[index]
                                  .clinicDentistName,
                              'clinicAddress': controller
                                  .clinic_subscribe_list[index].clinicAddress,
                              'clinicContact': controller
                                  .clinic_subscribe_list[index].clinicContactNo,
                              'clinicEmail': controller
                                  .clinic_subscribe_list[index].clinicEmail,
                              'clinicTotalPayment': controller
                                  .clinic_subscribe_list[index]
                                  .subscriptionAmount,
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        controller.clinic_subscribe_list[index]
                                            .clinicId,
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        controller.clinic_subscribe_list[index]
                                            .clinicName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: Sizer.fontsize(
                                                context: context, size: 13)),
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        controller.clinic_subscribe_list[index]
                                            .clinicAddress,
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "P " +
                                            controller
                                                .clinic_subscribe_list[index]
                                                .subscriptionAmount,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: Sizer.fontsize(
                                                context: context, size: 13)),
                                      ))),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
