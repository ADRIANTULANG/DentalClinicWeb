import 'package:dentalclinic/configs/class_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../register_clinic/view/register_clinic_view.dart';
import '../controller/login_screen_controller.dart';

class LoginScreenViewClinicLogin extends GetView<LoginController> {
  const LoginScreenViewClinicLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white10,
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.02),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 3)
              ],
              color: Colors.white,
              // borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: Sizer.height(context: context, size: 90),
                  width: Sizer.width(context: context, size: 32),
                  padding: EdgeInsets.only(
                      left: Sizer.width(context: context, size: 0.5),
                      bottom: Sizer.height(context: context, size: 9)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Sizer.height(size: 2, context: context),
                      ),
                      // Container(
                      //   alignment: Alignment.centerLeft,
                      //   width: Sizer.width(context: context, size: 100),
                      //   child: Row(
                      //     children: [
                      //       InkWell(
                      //           onTap: () {
                      //             if (controller.loginAsAdmin.value == true) {
                      //               controller.loginAsAdmin.value = false;
                      //             } else {
                      //               controller.loginAsAdmin.value = true;
                      //             }
                      //           },
                      //           child: Icon(Icons.admin_panel_settings)),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: Sizer.height(size: 20, context: context),
                      ),
                      Container(
                        width: Sizer.width(context: context, size: 100),
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize:
                                  Sizer.fontsize(context: context, size: 40),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        width: Sizer.width(context: context, size: 100),
                        child: Text(
                          "to Dental Clinic",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize:
                                  Sizer.fontsize(context: context, size: 40),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        width: Sizer.width(context: context, size: 100),
                        child: Text(
                          "Appointment &",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize:
                                  Sizer.fontsize(context: context, size: 40),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        width: Sizer.width(context: context, size: 100),
                        child: Text(
                          "Management System",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize:
                                  Sizer.fontsize(context: context, size: 40),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: Sizer.width(context: context, size: 1),
                      ),
                      Container(
                        width: Sizer.width(context: context, size: 100),
                        child: Text(
                          "Appoint or Reserve any",
                          style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.black,
                              fontSize:
                                  Sizer.fontsize(context: context, size: 20),
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container(
                        width: Sizer.width(context: context, size: 100),
                        child: Text(
                          "Dental Services",
                          style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.black,
                              fontSize:
                                  Sizer.fontsize(context: context, size: 20),
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Sizer.height(context: context, size: 90),
                  width: Sizer.width(context: context, size: 28),
                  // child: Image.asset("assets/images/DCAMSNEW.png"),
                ),
                Container(
                  height: Sizer.height(context: context, size: 90),
                  width: Sizer.width(context: context, size: 30),
                  padding: EdgeInsets.only(
                      left: Sizer.width(context: context, size: 3),
                      right: Sizer.width(context: context, size: 3),
                      top: Sizer.height(context: context, size: 6),
                      bottom: Sizer.height(context: context, size: 28)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: Sizer.width(context: context, size: 1),
                            right: Sizer.width(context: context, size: 1),
                          ),
                          height: Sizer.height(context: context, size: 10),
                          width: Sizer.width(context: context, size: 100),
                          child: TextField(
                            controller: controller.username,
                            obscureText: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9)),
                                labelText: 'User Name',
                                hintText: 'Enter User Name',
                                hintStyle: TextStyle(
                                    fontSize: Sizer.fontsize(
                                        context: context, size: 15)),
                                labelStyle: TextStyle(
                                    fontSize: Sizer.fontsize(
                                        context: context, size: 15))),
                          ),
                        ),
                        SizedBox(
                          height: Sizer.height(context: context, size: 1),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: Sizer.width(context: context, size: 1),
                              right: Sizer.width(context: context, size: 1)),
                          height: Sizer.height(context: context, size: 10),
                          width: Sizer.width(context: context, size: 100),
                          child: TextField(
                            controller: controller.password,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9)),
                                labelText: 'Password',
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(
                                    fontSize: Sizer.fontsize(
                                        context: context, size: 15)),
                                labelStyle: TextStyle(
                                    fontSize: Sizer.fontsize(
                                        context: context, size: 15))),
                          ),
                        ),
                        SizedBox(
                          height: Sizer.height(context: context, size: 2),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: Sizer.width(context: context, size: 1),
                              right: Sizer.width(context: context, size: 1)),
                          child: Divider(),
                        ),
                        SizedBox(
                          height: Sizer.height(context: context, size: 4),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: Sizer.width(context: context, size: 1),
                              right: Sizer.width(context: context, size: 1)),
                          child: Obx(
                            () => controller.isLoading.value == true
                                ? Container(
                                    height:
                                        Sizer.height(context: context, size: 7),
                                    width: Sizer.width(
                                        context: context, size: 100),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 162, 181, 233),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: CircularProgressIndicator(
                                        color: Colors.white))
                                : InkWell(
                                    onTap: () {
                                      // if (controller.loginAsAdmin.value ==
                                      //     true) {
                                      //   controller.login();
                                      // } else {
                                      controller.loginClinic();
                                      // }
                                    },
                                    child: Container(
                                        height: Sizer.height(
                                            context: context, size: 7),
                                        width: Sizer.width(
                                            context: context, size: 100),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 162, 181, 233),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        )),
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: Sizer.height(context: context, size: 3),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont have an account? ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  fontSize: Sizer.fontsize(
                                      size: 12, context: context)),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => RegisterClinicView());
                              },
                              child: Text(
                                "Sign up ",
                                style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1,
                                    fontSize: Sizer.fontsize(
                                        size: 12, context: context)),
                              ),
                            )
                          ],
                        )
                        // RegisterClinicView
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       left: Sizer.width(context: context, size: 1),
                        //       right: Sizer.width(context: context, size: 1)),
                        //   child: InkWell(
                        //     onTap: () {},
                        //     child: Container(
                        //         height: Sizer.height(context: context, size: 7),
                        //         width: Sizer.width(context: context, size: 100),
                        //         alignment: Alignment.center,
                        //         decoration: BoxDecoration(
                        //             color: Colors.green[700],
                        //             borderRadius: BorderRadius.circular(10)),
                        //         child: Text(
                        //           "Register",
                        //           style: TextStyle(fontWeight: FontWeight.w500),
                        //         )),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
