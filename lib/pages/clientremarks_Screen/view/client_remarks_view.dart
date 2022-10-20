import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../configs/class_sizer.dart';
import '../controller/client_remarks_controller.dart';

class ClientRemarskView extends GetView<ClientReemarksController> {
  const ClientRemarskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClientReemarksController());
    return Scaffold(
      body: Container(
        height: Sizer.height(context: context, size: 100),
        width: Sizer.width(context: context, size: 100),
        padding: EdgeInsets.only(
          left: Sizer.width(context: context, size: 3),
          right: Sizer.width(context: context, size: 3),
          top: Sizer.height(context: context, size: 2),
          bottom: Sizer.height(context: context, size: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    "Records of ${controller.clientName.value}",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: Sizer.fontsize(context: context, size: 20)),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    controller.isRefreshingRemarks(true);
                    await controller.getRemarsk();
                    controller.isRefreshingRemarks(false);
                  },
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 153, 211, 238),
                    radius: Sizer.width(context: context, size: 1),
                    child: Obx(
                      () => controller.isRefreshingRemarks.value == true
                          ? Container(
                              width: Sizer.width(context: context, size: .8),
                              height: Sizer.height(context: context, size: 1.8),
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
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Record ID",
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
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  Sizer.fontsize(context: context, size: 15)),
                        ))),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Contact.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  Sizer.fontsize(context: context, size: 15)),
                        ))),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Dentist",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  Sizer.fontsize(context: context, size: 15)),
                        ))),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Remarks",
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
                  itemCount: controller.remarkslist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: Sizer.height(context: context, size: 3)),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller.remarkslist[index].remId,
                                    ))),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller.remarkslist[index].clinicName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: Sizer.fontsize(
                                              context: context, size: 13)),
                                    ))),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller.remarkslist[index].clinicEmail,
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
                                          .remarkslist[index].clinicContactNo,
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
                                          .remarkslist[index].clinicDentistName,
                                    ))),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(controller
                                        .remarkslist[index].remarks))),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
