import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageServices extends GetxController {
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  saveCredentials({
    required String empId,
    required String empName,
    required String empUsername,
    required String empPass,
    required String empPosition,
  }) {
    storage.write("empId", empId);
    storage.write("empName", empName);
    storage.write("empUsername", empUsername);
    storage.write("empPass", empPass);
    storage.write("empPosition", empPosition);
  }

  saveCredentialsForClinic({
    required String accountId,
    required String username,
    required String password,
    required String userId,
    required String userType,
  }) {
    storage.write("accountId", accountId);
    storage.write("username", username);
    storage.write("password", password);
    storage.write("userId", userId);
    storage.write("userType", userType);
  }

  saveClinicDetails({
    required String clinicId,
    required String clinicName,
    required String clinicAddress,
    required String clinicImage,
    required String clinicEmail,
    required String clinicContactNo,
    required String fcmToken,
    required String clinicStatus,
    required String subscriptionStatus,
    required String subscriptionAmount,
  }) {
    storage.write("clinicId", clinicId);
    storage.write("clinicName", clinicName);
    storage.write("clinicAddress", clinicAddress);
    storage.write("clinicImage", clinicImage);
    storage.write("clinicEmail", clinicEmail);

    storage.write("clinicContactNo", clinicContactNo);
    storage.write("fcmToken", fcmToken);
    storage.write("clinicStatus", clinicStatus);
    storage.write("subscriptionStatus", subscriptionStatus);
    storage.write("subscriptionAmount", subscriptionAmount);
  }

  removeCredentials() {
    storage.remove("empId");
    storage.remove("empName");
    storage.remove("empUsername");
    storage.remove("empPass");
    storage.remove("empPosition");

    storage.remove("accountId");
    storage.remove("username");
    storage.remove("password");
    storage.remove("userId");
    storage.remove("userType");

    storage.remove("clinicId");
    storage.remove("clinicName");
    storage.remove("clinicAddress");
    storage.remove("clinicImage");
    storage.remove("clinicEmail");
    storage.remove("clinicContactNo");
    storage.remove("fcmToken");
    storage.remove("clinicStatus");
    storage.remove("subscriptionStatus");
    storage.remove("subscriptionAmount");
  }
}
