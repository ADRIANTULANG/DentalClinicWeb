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

  removeCredentials() {
    storage.remove("empId");
    storage.remove("empName");
    storage.remove("empUsername");
    storage.remove("empPass");
    storage.remove("empPosition");
  }
}
