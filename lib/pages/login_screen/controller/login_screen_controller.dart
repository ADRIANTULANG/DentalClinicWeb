import 'package:dentalclinic/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard_screen/view/dashboard_view.dart';
import '../../web_clinic_home/view/web_clinic_home_view.dart';
import '../api/login_api.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxList<LoginModel> adminDetails = <LoginModel>[].obs;
  //clinic
  RxBool loginAsAdmin = false.obs;
  //admin
  // RxBool loginAsAdmin = true.obs;
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

  loginClinic() async {
    isLoading(true);
    List<LoginClinicModel> loginClinicResult = await LoginApi.FutureloginClinic(
        username: username.text, password: password.text);
    if (loginClinicResult.length != 0) {
      List<ClinicDetails> clinicDetails =
          await LoginApi.clinicDetails(clinicID: loginClinicResult[0].userId);
      if (clinicDetails[0].clinicStatus == "Approved") {
        await Get.find<StorageServices>().saveCredentialsForClinic(
            accountId: loginClinicResult[0].accountId,
            username: loginClinicResult[0].username,
            password: loginClinicResult[0].password,
            userId: loginClinicResult[0].userId,
            userType: loginClinicResult[0].userType);
        await Get.find<StorageServices>().saveClinicDetails(
            clinicId: clinicDetails[0].clinicId,
            clinicName: clinicDetails[0].clinicName,
            clinicAddress: clinicDetails[0].clinicAddress,
            clinicImage: clinicDetails[0].clinicImage,
            clinicEmail: clinicDetails[0].clinicEmail,
            clinicContactNo: clinicDetails[0].clinicContactNo,
            fcmToken: clinicDetails[0].fcmToken,
            clinicStatus: clinicDetails[0].clinicStatus,
            subscriptionStatus: clinicDetails[0].subscriptionStatus,
            subscriptionAmount: clinicDetails[0].subscriptionAmount);

        Get.offAll(() => WebClinicHomeView());
      } else if (clinicDetails[0].clinicStatus == "Pending") {
        Get.snackbar(
          "Message",
          "This clinic is still 'Pending'. Contact admin for more details.",
          colorText: Colors.white,
          backgroundColor: Color.fromARGB(255, 145, 209, 236),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
        );
      } else if (clinicDetails[0].clinicStatus == "Removed") {
        Get.snackbar(
          "Message",
          "This clinic was 'Removed' by the management. Contact admin for more details.",
          colorText: Colors.white,
          backgroundColor: Color.fromARGB(255, 145, 209, 236),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
        );
      } else if (clinicDetails[0].clinicStatus == "Denied") {
        Get.snackbar(
          "Message",
          "This clinic was 'Denied' by the management. Contact admin for more details.",
          colorText: Colors.white,
          backgroundColor: Color.fromARGB(255, 145, 209, 236),
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        print("here");
      }
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
