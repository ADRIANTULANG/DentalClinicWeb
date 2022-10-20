import 'package:dentalclinic/pages/clientremarks_Screen/api/client_remarks_api.dart';
import 'package:get/get.dart';

import '../model/client_remarks_model.dart';

class ClientReemarksController extends GetxController {
  RxString clinicID = "".obs;
  RxString clientName = "".obs;
  RxList<Remarks> remarkslist = <Remarks>[].obs;
  RxList<Remarks> remarkslistMasterList = <Remarks>[].obs;
  RxBool isRefreshingRemarks = false.obs;
  @override
  void onInit() async {
    clinicID.value = await Get.arguments['clinicID'];
    clientName.value = await Get.arguments['clientName'];
    getRemarsk();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getRemarsk() async {
    var result = await ClientRemarksApi.getRemarks(clientID: clinicID.value);
    remarkslist.assignAll(result.reversed.toList());
    remarkslistMasterList.assignAll(result.reversed.toList());
  }
}
