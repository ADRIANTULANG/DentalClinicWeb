import 'package:dentalclinic/constant/endPoints.dart';
import 'package:dentalclinic/pages/web_clinic_home/controller/web_clinic_home_controller.dart';
import 'package:dentalclinic/pages/web_clinic_home/widgets/approved.dart';
import 'package:dentalclinic/pages/web_clinic_home/widgets/denstist.dart';
import 'package:dentalclinic/pages/web_clinic_home/widgets/home.dart';
import 'package:dentalclinic/pages/web_clinic_home/widgets/pendings.dart';
import 'package:dentalclinic/pages/web_clinic_home/widgets/services.dart';
import 'package:dentalclinic/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/class_sizer.dart';
import '../../login_screen/view/login_screen_view.dart';
import '../widgets/accesslog.dart';
import '../widgets/settings.dart';
import '../widgets/walkin.dart';

class WebClinicHomeView extends GetView<WebClinicController> {
  const WebClinicHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WebClinicController());
    return Scaffold(
      body: Container(
        width: Sizer.width(context: context, size: 100),
        height: Sizer.height(context: context, size: 100),
        child: Row(
          children: [
            Container(
              height: Sizer.height(context: context, size: 100),
              width: Sizer.width(context: context, size: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Sizer.width(context: context, size: 15),
                    height: Sizer.height(context: context, size: 20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                AppEndpoint.endPointDomain_image +
                                    "/" +
                                    Get.find<StorageServices>()
                                        .storage
                                        .read('clinicImage')))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: Text(
                      Get.find<StorageServices>().storage.read('clinicName'),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Sizer.fontsize(context: context, size: 20),
                          letterSpacing: 2),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: Text(
                      Get.find<StorageServices>().storage.read('clinicAddress'),
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: Sizer.fontsize(context: context, size: 12),
                          letterSpacing: 2),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: Text(
                      Get.find<StorageServices>().storage.read('clinicEmail'),
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: Sizer.fontsize(context: context, size: 12),
                          letterSpacing: 2),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: Text(
                      Get.find<StorageServices>()
                          .storage
                          .read('clinicContactNo'),
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: Sizer.fontsize(context: context, size: 12),
                          letterSpacing: 2),
                    ),
                  ),
                  SizedBox(
                    height: Sizer.height(size: 5, context: context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: InkWell(
                      onTap: () {
                        controller.selectedIndex.value = 0;
                      },
                      child: Obx(
                        () => Container(
                          height: Sizer.height(size: 4, context: context),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 0
                                  ? Color.fromARGB(255, 179, 206, 228)
                                  : Colors.white),
                          child: Text(
                            "Dashboard",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 12),
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizer.height(size: .5, context: context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: InkWell(
                      onTap: () {
                        controller.selectedIndex.value = 1;
                      },
                      child: Obx(
                        () => Container(
                          height: Sizer.height(size: 4, context: context),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 1
                                  ? Color.fromARGB(255, 179, 206, 228)
                                  : Colors.white),
                          child: Text(
                            "Services",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 12),
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizer.height(size: .5, context: context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: InkWell(
                      onTap: () {
                        controller.selectedIndex.value = 2;
                      },
                      child: Obx(
                        () => Container(
                          height: Sizer.height(size: 4, context: context),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 2
                                  ? Color.fromARGB(255, 179, 206, 228)
                                  : Colors.white),
                          child: Text(
                            "Dentist",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 12),
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizer.height(size: .5, context: context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: InkWell(
                      onTap: () {
                        controller.selectedIndex.value = 3;
                      },
                      child: Obx(
                        () => Container(
                          height: Sizer.height(size: 4, context: context),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 3
                                  ? Color.fromARGB(255, 179, 206, 228)
                                  : Colors.white),
                          child: Text(
                            "Pending",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 12),
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizer.height(size: .5, context: context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: InkWell(
                      onTap: () {
                        controller.selectedIndex.value = 4;
                      },
                      child: Obx(
                        () => Container(
                          height: Sizer.height(size: 4, context: context),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 4
                                  ? Color.fromARGB(255, 179, 206, 228)
                                  : Colors.white),
                          child: Text(
                            "Approve",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 12),
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizer.height(size: .5, context: context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: InkWell(
                      onTap: () {
                        controller.selectedIndex.value = 5;
                      },
                      child: Obx(
                        () => Container(
                          height: Sizer.height(size: 4, context: context),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 5
                                  ? Color.fromARGB(255, 179, 206, 228)
                                  : Colors.white),
                          child: Text(
                            "Walk in",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 12),
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizer.height(size: .5, context: context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: InkWell(
                      onTap: () {
                        controller.selectedIndex.value = 6;
                      },
                      child: Obx(
                        () => Container(
                          height: Sizer.height(size: 4, context: context),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 6
                                  ? Color.fromARGB(255, 179, 206, 228)
                                  : Colors.white),
                          child: Text(
                            "Access logs",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 12),
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizer.height(size: .5, context: context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: InkWell(
                      onTap: () {
                        controller.selectedIndex.value = 7;
                      },
                      child: Obx(
                        () => Container(
                          height: Sizer.height(size: 4, context: context),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 7
                                  ? Color.fromARGB(255, 179, 206, 228)
                                  : Colors.white),
                          child: Text(
                            "Settings",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    Sizer.fontsize(context: context, size: 12),
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Sizer.width(size: .3, context: context)),
                    child: InkWell(
                      onTap: () async {
                        await Get.find<StorageServices>().removeCredentials();
                        Get.offAll(() => LoginScreenView());
                      },
                      child: Container(
                        height: Sizer.height(size: 4, context: context),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 136, 135, 135)),
                        child: Text(
                          "Log out",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize:
                                  Sizer.fontsize(context: context, size: 12),
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizer.height(size: 2, context: context),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            Obx(
              () => Expanded(
                  child: controller.selectedIndex.value == 0
                      ? Home()
                      : controller.selectedIndex.value == 1
                          ? Services()
                          : controller.selectedIndex.value == 2
                              ? Dentist()
                              : controller.selectedIndex.value == 3
                                  ? Pending()
                                  : controller.selectedIndex.value == 4
                                      ? Approved()
                                      : controller.selectedIndex.value == 5
                                          ? Walkin()
                                          : controller.selectedIndex.value == 6
                                              ? Accesslog()
                                              : Settings()),
            )
          ],
        ),
      ),
    );
  }
}
