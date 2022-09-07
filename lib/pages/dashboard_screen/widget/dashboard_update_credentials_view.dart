import 'package:dentalclinic/pages/dashboard_screen/controller/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../configs/class_sizer.dart';

class DashboardCredentialsView extends GetView<DashboardController> {
  const DashboardCredentialsView({Key? key}) : super(key: key);

  @override
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Sizer.width(context: context, size: 100),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Account Details",
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                      fontSize: Sizer.fontsize(context: context, size: 25)),
                ),
              ),
              SizedBox(
                height: Sizer.height(context: context, size: 2),
              ),
              Divider(),
              SizedBox(
                height: Sizer.height(context: context, size: 2),
              ),
              Container(
                width: Sizer.width(context: context, size: 100),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontSize: Sizer.fontsize(context: context, size: 14),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(context: context, size: 1),
              ),
              Container(
                height: Sizer.height(context: context, size: 6),
                width: Sizer.width(context: context, size: 45),
                child: TextField(
                  controller: controller.account_name,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        bottom: Sizer.height(context: context, size: 1),
                        left: Sizer.width(context: context, size: 1)),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9)),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(context: context, size: 2),
              ),
              Container(
                width: Sizer.width(context: context, size: 100),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Position",
                  style: TextStyle(
                    fontSize: Sizer.fontsize(context: context, size: 14),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(context: context, size: 1),
              ),
              Container(
                  height: Sizer.height(context: context, size: 6),
                  width: Sizer.width(context: context, size: 45),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                      left: Sizer.width(context: context, size: 1)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Text(
                    "Admin",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: Sizer.fontsize(context: context, size: 15)),
                  )),
              SizedBox(
                height: Sizer.height(context: context, size: 2),
              ),
              Container(
                width: Sizer.width(context: context, size: 100),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Username",
                  style: TextStyle(
                    fontSize: Sizer.fontsize(context: context, size: 14),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(context: context, size: 1),
              ),
              Container(
                height: Sizer.height(context: context, size: 6),
                width: Sizer.width(context: context, size: 45),
                child: TextField(
                  controller: controller.account_username,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        bottom: Sizer.height(context: context, size: 1),
                        left: Sizer.width(context: context, size: 1)),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9)),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(context: context, size: 2),
              ),
              Container(
                width: Sizer.width(context: context, size: 100),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: Sizer.fontsize(context: context, size: 14),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(context: context, size: 1),
              ),
              Container(
                height: Sizer.height(context: context, size: 6),
                width: Sizer.width(context: context, size: 45),
                child: TextField(
                  controller: controller.account_password,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        bottom: Sizer.height(context: context, size: 1),
                        left: Sizer.width(context: context, size: 1)),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9)),
                  ),
                ),
              ),
              SizedBox(
                height: Sizer.height(context: context, size: 3),
              ),
              InkWell(
                onTap: () {
                  controller.update_account();
                },
                child: Container(
                    height: Sizer.height(context: context, size: 6),
                    width: Sizer.width(context: context, size: 45),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 1,
                              color: Colors.grey)
                        ]),
                    child: Text(
                      "Update",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: Sizer.fontsize(context: context, size: 18)),
                    )),
              ),
            ],
          )),
    );
  }
}
