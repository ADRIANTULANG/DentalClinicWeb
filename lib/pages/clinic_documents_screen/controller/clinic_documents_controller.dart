import 'package:get/get.dart';

import '../api/clinic_documents_api.dart';
import '../model/clinic_documents_model.dart';

class ClinicDocumentsController extends GetxController {
  RxString dentalClinicName = "".obs;
  RxString dentalClinicDentist = "".obs;
  RxString dentalClinicAddress = "".obs;
  RxString dentalClinicContactNumber = "".obs;
  RxString dentalClinicEmail = "".obs;
  RxString dentalClinicID = "".obs;

  RxList<ClinicDocuments> clinicDocumentsList = <ClinicDocuments>[].obs;
  @override
  void onInit() async {
    dentalClinicID.value = await Get.arguments['dentalClinicID'];
    dentalClinicName.value = await Get.arguments['dentalClinicName'];
    dentalClinicDentist.value = await Get.arguments['dentalClinicDentist'];
    dentalClinicAddress.value = await Get.arguments['dentalClinicAddress'];
    dentalClinicContactNumber.value =
        await Get.arguments['dentalClinicContactNumber'];
    dentalClinicEmail.value = await Get.arguments['dentalClinicEmail'];
    await getDocuments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getDocuments() async {
    print("clinicID: ${dentalClinicID.value}");

    var result = await await ClinicDocumentsApi.getClinicDocuments(
        clinicID: dentalClinicID.value);
    clinicDocumentsList.assignAll(result.reversed.toList());
  }
}
