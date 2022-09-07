import 'package:dentalclinic/pages/dashboard_screen/controller/dashboard_controller.dart';
import 'package:dentalclinic/pages/dashboard_screen/dialog/dashboard_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/class_sizer.dart';

class DashboardClientssView extends GetView<DashboardController> {
  const DashboardClientssView({Key? key}) : super(key: key);

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
                      "Registered Clients",
                      style: TextStyle(
                          letterSpacing: 2,
                          fontWeight: FontWeight.w700,
                          fontSize: Sizer.fontsize(context: context, size: 25)),
                    ),
                    Container(
                      height: Sizer.height(context: context, size: 6),
                      width: Sizer.width(context: context, size: 45),
                      child: TextField(
                        controller: controller.clientTextEdditing,
                        obscureText: false,
                        onChanged: (value) {
                          controller.searchClients(
                              value: controller.clientTextEdditing.text);
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.clientTextEdditing.clear();
                                  FocusScope.of(context).unfocus();
                                  controller.clients
                                      .assignAll(controller.clients_masterList);
                                },
                                icon: Icon(Icons.clear)),
                            contentPadding: EdgeInsets.only(
                                bottom: Sizer.height(context: context, size: 1),
                                left: Sizer.width(context: context, size: 1)),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9)),
                            labelText: 'Search Client',
                            // hintText: 'Enter Clinic Name',
                            hintStyle: TextStyle(
                                fontSize:
                                    Sizer.fontsize(context: context, size: 9)),
                            labelStyle: TextStyle(
                                fontSize:
                                    Sizer.fontsize(context: context, size: 9))),
                      ),
                    ),
                  ],
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
                            "Client ID",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Client Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Client Address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Client Contact No.",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Client Email Add",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 15)),
                          ))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft, child: Text(""))),
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
                    itemCount: controller.clients.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: Sizer.height(context: context, size: 3)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        controller.clients[index].clientId))),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller.clients[index].clientName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: Sizer.fontsize(
                                              context: context, size: 13)),
                                    ))),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(controller
                                        .clients[index].clientAddress))),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(controller
                                        .clients[index].clientContactNo))),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(controller
                                        .clients[index].clientEmail))),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: Sizer.width(context: context, size: 2),
                                  right: Sizer.width(context: context, size: 2),
                                ),
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: TextButton(
                                      onPressed: () {
                                        DashboardDialog.showConfirmToDelete(
                                            context: context,
                                            controller: controller,
                                            clientID: controller
                                                .clients[index].clientId);
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: Sizer.fontsize(
                                                context: context, size: 15),
                                            color: Colors.white),
                                      ),
                                    )),
                              ),
                            ),
                          ],
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
