import 'package:dentalclinic/pages/login_screen/view/login_screen_view_admin_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_screen_controller.dart';
import 'login_screen_view_clinic_login.dart';

class LoginMain extends GetView<LoginController> {
  const LoginMain();

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        body: Obx(() => controller.loginAsAdmin.value == false
            ? LoginScreenViewClinicLogin()
            : LoginScreenViewAdmin()));
  }
}
