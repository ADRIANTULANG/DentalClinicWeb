import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../configs/class_sizer.dart';
import '../../../constant/endPoints.dart';
import '../controller/clinic_documents_controller.dart';
import '../dialogs/clinic__documents_dialog.dart';

class ClinicDocuments extends GetView<ClinicDocumentsController> {
  const ClinicDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClinicDocumentsController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(
          Sizer.height(context: context, size: 3),
        ),
        child: Container(
          // height: Sizer.height(context: context, size: 100),
          // width: Sizer.width(context: context, size: 100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 10)
              ]),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    left: Sizer.width(context: context, size: 1.5),
                    top: Sizer.height(context: context, size: 3)),
                width: Sizer.width(context: context, size: 100),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_outlined)),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: Sizer.width(context: context, size: 1.5),
                    right: Sizer.width(context: context, size: 1.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Sizer.width(context: context, size: 35),
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
                                controller.dentalClinicName.value,
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
                          //       controller.dentalClinicDentist.value,
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
                                controller.dentalClinicAddress.value,
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
                                controller.dentalClinicContactNumber.value,
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
                                controller.dentalClinicEmail.value,
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
                      width: Sizer.width(context: context, size: 55),
                      height: Sizer.height(context: context, size: 25),
                      alignment: Alignment.centerRight,
                      // color: Colors.red,
                      child: Image.asset("assets/images/loginimage.png"),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: Sizer.width(context: context, size: 1.5),
                    top: Sizer.height(context: context, size: 3)),
                width: Sizer.width(context: context, size: 100),
                child: Text(
                  "Documents",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizer.fontsize(context: context, size: 30),
                      letterSpacing: 2),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Sizer.width(context: context, size: 2),
                    bottom: Sizer.height(context: context, size: 1),
                    right: Sizer.width(context: context, size: 2)),
                child: Divider(),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      left: Sizer.width(context: context, size: 2),
                      bottom: Sizer.height(context: context, size: 2),
                      right: Sizer.width(context: context, size: 2)),
                  child: Obx(
                    () => controller.clinicDocumentsList.length == 0
                        ? Center(
                            child: Text(
                              "Sorry. No Available Documents for this Clinic.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizer.fontsize(
                                      context: context, size: 18)),
                            ),
                          )
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7,
                                    childAspectRatio: 1,
                                    mainAxisSpacing:
                                        Sizer.height(context: context, size: 1),
                                    crossAxisSpacing: Sizer.width(
                                        context: context, size: .5)),
                            itemCount: controller.clinicDocumentsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  ClinicDocumentsDialogs.showImageDialog(
                                      image: controller
                                          .clinicDocumentsList[index]
                                          .clinicImgDocument,
                                      context: context);
                                },
                                child: Container(
                                  height:
                                      Sizer.height(context: context, size: 2),
                                  width: Sizer.width(context: context, size: 3),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${AppEndpoint.endPointDomain_image}/${controller.clinicDocumentsList[index].clinicImgDocument}"))),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
