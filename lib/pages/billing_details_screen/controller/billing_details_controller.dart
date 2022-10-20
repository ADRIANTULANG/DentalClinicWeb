import 'package:get/get.dart';

import '../api/billing_details_api.dart';
import '../model/billing_details_model.dart';

class BillingDetailsController extends GetxController {
  RxList<ClinicBillingDetails> clinicDateList = <ClinicBillingDetails>[].obs;
  RxString clinicID = "".obs;
  RxString clinicName = "".obs;
  RxString clinicDentist = "".obs;
  RxString clinicContact = "".obs;
  RxString clinicEmail = "".obs;
  RxString clinicAddress = "".obs;
  RxString clinicTotalPayment = "".obs;

  RxBool isLoading = true.obs;
  RxBool isRefreshing = false.obs;
  @override
  void onInit() async {
    clinicID.value = await Get.arguments['clinicID'];
    clinicName.value = await Get.arguments['clinicName'];
    clinicDentist.value = await Get.arguments['clinicDentist'];
    clinicContact.value = await Get.arguments['clinicContact'];
    clinicEmail.value = await Get.arguments['clinicEmail'];
    clinicAddress.value = await Get.arguments['clinicAddress'];
    clinicTotalPayment.value = await Get.arguments['clinicTotalPayment'];
    getClinicBillingDetails(clinicID: clinicID.value);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getClinicBillingDetails({required String clinicID}) async {
    List<ClinicBillingDetails> result =
        await BillingDetailsApi.getClinicBillingDetails(clinicID: clinicID);
    clinicDateList.assignAll(result.reversed.toList());
    isLoading(false);
  }
}
