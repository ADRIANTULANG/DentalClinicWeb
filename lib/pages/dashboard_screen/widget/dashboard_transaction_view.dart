import 'package:dentalclinic/pages/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/class_sizer.dart';
import '../../clientremarks_Screen/view/client_remarks_view.dart';
// import '../../billing_details_screen/view/billing_details_view.dart';

class DashboardTransactionView extends GetView<DashboardController> {
  const DashboardTransactionView({Key? key}) : super(key: key);

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
                      "Transaction Monitoring",
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
                                  controller.totaltransactionBalance.value
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Sizer.height(context: context, size: 6),
                    width: Sizer.width(context: context, size: 60),
                    child: TextField(
                      controller: controller.transactionsTextEditing,
                      obscureText: false,
                      onChanged: (value) {
                        controller.searchTransactions(
                            value: controller.transactionsTextEditing.text);
                      },
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.transactionsTextEditing.clear();
                                FocusScope.of(context).unfocus();
                                controller.transactions.assignAll(
                                    controller.transactions_masterListt);
                              },
                              icon: Icon(Icons.clear)),
                          contentPadding: EdgeInsets.only(
                              bottom: Sizer.height(context: context, size: 1),
                              left: Sizer.width(context: context, size: 1)),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9)),
                          labelText: 'Search Name',
                          // hintText: 'Enter Clinic Name',
                          hintStyle: TextStyle(
                              fontSize:
                                  Sizer.fontsize(context: context, size: 9)),
                          labelStyle: TextStyle(
                              fontSize:
                                  Sizer.fontsize(context: context, size: 9))),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      controller.isRefreshingTransactions(true);
                      await controller.getTransactions();
                      controller.isRefreshingTransactions(false);
                    },
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 153, 211, 238),
                      radius: Sizer.width(context: context, size: 1),
                      child: Obx(
                        () => controller.isRefreshingTransactions.value == true
                            ? Container(
                                width: Sizer.width(context: context, size: .8),
                                height:
                                    Sizer.height(context: context, size: 1.8),
                                alignment: Alignment.center,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Icon(
                                Icons.refresh,
                                color: Colors.black,
                              ),
                      ),
                    ),
                  )
                ],
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
                            "Transaction ID",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Service",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Clinic",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                  // Expanded(
                  //     child: Container(
                  //         alignment: Alignment.centerLeft,
                  //         child: Text(
                  //           "Dentist",
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize:
                  //                   Sizer.fontsize(context: context, size: 15)),
                  //         ))),
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
                    itemCount: controller.transactions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: Sizer.height(context: context, size: 3)),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ClientRemarskView(), arguments: {
                              "clinicID":
                                  controller.transactions[index].resClientId,
                              "clientName":
                                  controller.transactions[index].client_name,
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        controller.transactions[index].resId,
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        controller
                                            .transactions[index].client_name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: Sizer.fontsize(
                                                context: context, size: 13)),
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        controller
                                            .transactions[index].resServiceName,
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(controller
                                          .transactions[index].clinicName))),
                              // Expanded(
                              //     child: Container(
                              //         alignment: Alignment.centerLeft,
                              //         child: Text(
                              //           controller.transactions[index]
                              //               .clinicDentistName,
                              //         ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "P " +
                                            controller
                                                .transactions[index].resFee,
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
