import 'package:dentalclinic/pages/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/class_sizer.dart';
import '../../clinic_documents_screen/view/clinic_documents_view.dart';

class DashboardClinicsView extends GetView<DashboardController> {
  const DashboardClinicsView({Key? key}) : super(key: key);

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
                      "Registered Clinics",
                      style: TextStyle(
                          letterSpacing: 2,
                          fontWeight: FontWeight.w700,
                          fontSize: Sizer.fontsize(context: context, size: 25)),
                    ),
                    Container(
                      height: Sizer.height(context: context, size: 6),
                      width: Sizer.width(context: context, size: 45),
                      child: TextField(
                        controller: controller.approvedTextEditing,
                        obscureText: false,
                        onChanged: (value) {
                          controller.searchDentalApproved(
                              value: controller.approvedTextEditing.text);
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.approvedTextEditing.clear();
                                  FocusScope.of(context).unfocus();
                                  controller.dentalClinic_approved.assignAll(
                                      controller
                                          .dentalClinic_approved_masterList);
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
                                fontSize:
                                    Sizer.fontsize(context: context, size: 9)),
                            labelStyle: TextStyle(
                                fontSize:
                                    Sizer.fontsize(context: context, size: 9))),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        controller.isRefreshingApproved(true);
                        await controller.getApprovedDentalClinic();
                        controller.isRefreshingApproved(false);
                      },
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 153, 211, 238),
                        radius: Sizer.width(context: context, size: 1),
                        child: Obx(
                          () => controller.isRefreshingApproved.value == true
                              ? Container(
                                  width:
                                      Sizer.width(context: context, size: .8),
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
                            "Clinic Documents",
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
                    itemCount: controller.dentalClinic_approved.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: Sizer.height(context: context, size: 3)),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ClinicDocuments(), arguments: {
                              'dentalClinicID': controller
                                  .dentalClinic_approved[index].clinicId,
                              'dentalClinicName': controller
                                  .dentalClinic_approved[index].clinicName,
                              'dentalClinicDentist': controller
                                  .dentalClinic_approved[index]
                                  .clinicDentistName,
                              'dentalClinicAddress': controller
                                  .dentalClinic_approved[index].clinicAddress,
                              'dentalClinicContactNumber': controller
                                  .dentalClinic_approved[index].clinicContactNo,
                              'dentalClinicEmail': controller
                                  .dentalClinic_approved[index].clinicEmail,
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        controller.dentalClinic_approved[index]
                                            .clinicId,
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        controller.dentalClinic_approved[index]
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
                                        controller.dentalClinic_approved[index]
                                            .clinicAddress,
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.folder,
                                        size: Sizer.fontsize(
                                            context: context, size: 25),
                                      ))),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        Sizer.width(context: context, size: 2),
                                    right:
                                        Sizer.width(context: context, size: 2),
                                  ),
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: TextButton(
                                        onPressed: () {
                                          controller.updateClinicStatus(
                                              status: "Removed",
                                              clinicID: controller
                                                  .dentalClinic_approved[index]
                                                  .clinicId);
                                        },
                                        child: Text(
                                          "Remove",
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
