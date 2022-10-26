import 'package:dentalclinic/configs/class_sizer.dart';
import 'package:dentalclinic/pages/dashboard_screen/widget/dashboard_clinics_view.dart';
import 'package:dentalclinic/pages/login_screen/view/login_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/storage_services.dart';
import '../controller/dashboard_controller.dart';
import '../widget/dashboard_approval_view.dart';
import '../widget/dashboard_billing_view.dart';
import '../widget/dashboard_clients_view.dart';
import '../widget/dashboard_transaction_view.dart';
import '../widget/dashboard_update_credentials_view.dart';

class DashBoardView extends GetView<DashboardController> {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      body: Container(
        height: Sizer.height(context: context, size: 100),
        width: Sizer.width(context: context, size: 100),
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.01,
            right: MediaQuery.of(context).size.width * 0.01,
            bottom: MediaQuery.of(context).size.height * 0.02),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: Sizer.height(context: context, size: 100),
                width: Sizer.width(context: context, size: 20),
                padding: EdgeInsets.only(
                    bottom: Sizer.height(context: context, size: 2)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, spreadRadius: 1, blurRadius: 10)
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                          ),
                          // color: Colors.red,
                          height: Sizer.height(context: context, size: 30),
                          // width: Sizer.width(context: context, size: 28),
                          child: Image.asset("assets/images/loginimage.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                          ),
                          child: InkWell(
                            onTap: () {
                              controller.isCredentialSelected.value = false;
                              controller.isApprovalSelected.value = true;
                              controller.isClientSelected.value = false;
                              controller.isClinicSelected.value = false;
                              controller.isBillingMonitoringSelected.value =
                                  false;
                              controller.isTransactionSelected.value = false;
                            },
                            child: Obx(
                              () => Container(
                                height: Sizer.height(context: context, size: 7),
                                width: Sizer.width(context: context, size: 100),
                                padding: EdgeInsets.only(
                                    left: Sizer.width(
                                        context: context, size: 3.5)),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: controller.isApprovalSelected.value ==
                                          true
                                      ? Colors.green[700]
                                      : Colors.white,
                                ),
                                child: Text(
                                  "Approval",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: Sizer.fontsize(
                                          context: context, size: 20)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Sizer.height(context: context, size: 1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                          ),
                          child: InkWell(
                            onTap: () {
                              controller.isCredentialSelected.value = false;
                              controller.isApprovalSelected.value = false;
                              controller.isClientSelected.value = false;
                              controller.isClinicSelected.value = true;
                              controller.isBillingMonitoringSelected.value =
                                  false;
                              controller.isTransactionSelected.value = false;
                            },
                            child: Obx(
                              () => Container(
                                height: Sizer.height(context: context, size: 7),
                                width: Sizer.width(context: context, size: 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      controller.isClinicSelected.value == true
                                          ? Colors.green[700]
                                          : Colors.white,
                                ),
                                padding: EdgeInsets.only(
                                    left: Sizer.width(
                                        context: context, size: 3.5)),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Clinics",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: Sizer.fontsize(
                                          context: context, size: 20)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Sizer.height(context: context, size: 1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                          ),
                          child: InkWell(
                            onTap: () {
                              controller.isCredentialSelected.value = false;
                              controller.isApprovalSelected.value = false;
                              controller.isClientSelected.value = true;
                              controller.isClinicSelected.value = false;
                              controller.isBillingMonitoringSelected.value =
                                  false;
                              controller.isTransactionSelected.value = false;
                            },
                            child: Obx(
                              () => Container(
                                height: Sizer.height(context: context, size: 7),
                                width: Sizer.width(context: context, size: 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      controller.isClientSelected.value == true
                                          ? Colors.green[700]
                                          : Colors.white,
                                ),
                                padding: EdgeInsets.only(
                                    left: Sizer.width(
                                        context: context, size: 3.5)),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Clients",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: Sizer.fontsize(
                                          context: context, size: 20)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Sizer.height(context: context, size: 1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                          ),
                          child: InkWell(
                            onTap: () {
                              controller.isCredentialSelected.value = false;
                              controller.isApprovalSelected.value = false;
                              controller.isClientSelected.value = false;
                              controller.isClinicSelected.value = false;
                              controller.isBillingMonitoringSelected.value =
                                  true;
                              controller.isTransactionSelected.value = false;
                            },
                            child: Obx(
                              () => Container(
                                height: Sizer.height(context: context, size: 7),
                                width: Sizer.width(context: context, size: 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: controller.isBillingMonitoringSelected
                                              .value ==
                                          true
                                      ? Colors.green[700]
                                      : Colors.white,
                                ),
                                padding: EdgeInsets.only(
                                    left: Sizer.width(
                                        context: context, size: 3.5)),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Billing",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: Sizer.fontsize(
                                          context: context, size: 20)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Sizer.height(context: context, size: 1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                          ),
                          child: InkWell(
                            onTap: () {
                              controller.isCredentialSelected.value = false;
                              controller.isApprovalSelected.value = false;
                              controller.isClientSelected.value = false;
                              controller.isClinicSelected.value = false;
                              controller.isBillingMonitoringSelected.value =
                                  false;
                              controller.isTransactionSelected.value = true;
                            },
                            child: Obx(
                              () => Container(
                                height: Sizer.height(context: context, size: 7),
                                width: Sizer.width(context: context, size: 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      controller.isTransactionSelected.value ==
                                              true
                                          ? Colors.green[700]
                                          : Colors.white,
                                ),
                                padding: EdgeInsets.only(
                                    left: Sizer.width(
                                        context: context, size: 3.5)),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Transactions",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: Sizer.fontsize(
                                          context: context, size: 20)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Sizer.height(context: context, size: 1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                          ),
                          child: InkWell(
                            onTap: () {
                              controller.isCredentialSelected.value = true;
                              controller.isApprovalSelected.value = false;
                              controller.isClientSelected.value = false;
                              controller.isClinicSelected.value = false;
                              controller.isBillingMonitoringSelected.value =
                                  false;
                              controller.isTransactionSelected.value = false;

                              controller.account_name.text =
                                  Get.find<StorageServices>()
                                      .storage
                                      .read("empName")
                                      .toString();
                              controller.account_username.text =
                                  Get.find<StorageServices>()
                                      .storage
                                      .read("empUsername")
                                      .toString();

                              controller.account_password.text =
                                  Get.find<StorageServices>()
                                      .storage
                                      .read("empPass")
                                      .toString();
                            },
                            child: Obx(
                              () => Container(
                                height: Sizer.height(context: context, size: 7),
                                width: Sizer.width(context: context, size: 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      controller.isCredentialSelected.value ==
                                              true
                                          ? Colors.green[700]
                                          : Colors.white,
                                ),
                                padding: EdgeInsets.only(
                                    left: Sizer.width(
                                        context: context, size: 3.5)),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Account",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: Sizer.fontsize(
                                          context: context, size: 20)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.01,
                        right: MediaQuery.of(context).size.width * 0.01,
                      ),
                      child: InkWell(
                        onTap: () async {
                          await Get.find<StorageServices>().removeCredentials();
                          Get.offAll(() => LoginMain());
                        },
                        child: Container(
                          height: Sizer.height(context: context, size: 7),
                          width: Sizer.width(context: context, size: 100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red[700],
                          ),
                          padding: EdgeInsets.only(
                              left: Sizer.width(context: context, size: 3.5)),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Log out",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                letterSpacing: 2,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 20)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: Sizer.height(context: context, size: 100),
                width: Sizer.width(context: context, size: 75),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 1, blurRadius: 10)
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: Sizer.width(context: context, size: 2),
                                top: Sizer.width(context: context, size: 2),
                              ),
                              width: Sizer.width(context: context, size: 60),
                              child: Text(
                                "Hello, ${Get.find<StorageServices>().storage.read("empName").toString()}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2,
                                    fontSize: Sizer.fontsize(
                                        context: context, size: 35)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: Sizer.width(context: context, size: 2),
                              ),
                              width: Sizer.width(context: context, size: 60),
                              child: Text(
                                "Welcome back!",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey[600],
                                    letterSpacing: 2,
                                    fontSize: Sizer.fontsize(
                                        context: context, size: 15)),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            height: Sizer.height(context: context, size: 15),
                            padding: EdgeInsets.only(
                              right: Sizer.width(context: context, size: 5),
                              top: Sizer.width(context: context, size: 2),
                            ),
                            alignment: Alignment.centerRight,
                            child: Image.asset("assets/images/DCAMSNEW.png"))
                      ],
                    ),
                    SizedBox(
                      height: Sizer.height(context: context, size: 2),
                    ),
                    Obx(() => controller.isApprovalSelected.value == true
                        ? DashboardApprovalView()
                        : controller.isClinicSelected.value == true
                            ? DashboardClinicsView()
                            : controller.isClientSelected.value == true
                                ? DashboardClientssView()
                                : controller.isBillingMonitoringSelected
                                            .value ==
                                        true
                                    ? DashboardBillingMonitoringView()
                                    : controller.isTransactionSelected.value ==
                                            true
                                        ? DashboardTransactionView()
                                        : DashboardCredentialsView()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
