import 'package:dentalclinic/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard_screen/view/dashboard_view.dart';
import '../api/login_api.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxList<LoginModel> adminDetails = <LoginModel>[].obs;

  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  login() async {
    isLoading(true);
    var result = await LoginApi.Futurelogin(
        username: username.text, password: password.text);
    adminDetails.assignAll(result);
    if (adminDetails.length != 0) {
      await Get.find<StorageServices>().saveCredentials(
        empId: adminDetails[0].empId,
        empName: adminDetails[0].empName,
        empUsername: adminDetails[0].empUsername,
        empPass: adminDetails[0].empPass,
        empPosition: adminDetails[0].empPosition,
      );
      Get.offAll(() => DashBoardView());
    } else {
      Get.snackbar(
        "Message",
        "Sorry. User did not exist.",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
    }
    isLoading(false);
  }
}
