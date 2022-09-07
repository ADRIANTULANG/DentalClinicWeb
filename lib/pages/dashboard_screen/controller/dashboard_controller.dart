import 'package:dentalclinic/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/dashboard_screen_api.dart';
import '../model/dashboard_model.dart';

class DashboardController extends GetxController {
  RxList<DentalApproved> dentalClinic_approved = <DentalApproved>[].obs;
  RxList<DentalApproved> dentalClinic_approved_masterList =
      <DentalApproved>[].obs;
  RxList<DentalPending> dentalClinic_pending = <DentalPending>[].obs;
  RxList<DentalPending> dentalClinic_pending_masterList = <DentalPending>[].obs;
  RxList<ClientsModel> clients = <ClientsModel>[].obs;
  RxList<ClientsModel> clients_masterList = <ClientsModel>[].obs;
  RxList<ClinicSubscribedModel> clinic_subscribe_list =
      <ClinicSubscribedModel>[].obs;
  RxList<ClinicSubscribedModel> clinic_subscribe_masterList =
      <ClinicSubscribedModel>[].obs;

  TextEditingController approvedTextEditing = TextEditingController();
  TextEditingController pendingTextEditing = TextEditingController();
  TextEditingController clientTextEdditing = TextEditingController();
  TextEditingController clinicSubscribeEditing = TextEditingController();

  @override
  void onInit() {
    getPendingDentalClinic();
    getApprovedDentalClinic();
    getClients();
    getSubscribedClinics();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  RxDouble totalBalance = 0.0.obs;

  RxBool isApprovalSelected = true.obs;
  RxBool isClinicSelected = false.obs;
  RxBool isClientSelected = false.obs;
  RxBool isCredentialSelected = false.obs;
  RxBool isBillingMonitoringSelected = false.obs;

  TextEditingController account_name = TextEditingController();
  TextEditingController account_username = TextEditingController();
  TextEditingController account_password = TextEditingController();

  getPendingDentalClinic() async {
    dentalClinic_pending.assignAll(await DashboardApi.getPendingDentalCare());
    dentalClinic_pending_masterList.assignAll(dentalClinic_pending);
  }

  getApprovedDentalClinic() async {
    dentalClinic_approved
        .assignAll(await DashboardApi.getApprovedDentalClinic());
    dentalClinic_approved_masterList.assignAll(dentalClinic_approved);
  }

  getSubscribedClinics() async {
    clinic_subscribe_list.assignAll(await DashboardApi.getSubscribedClinic());
    clinic_subscribe_masterList.assignAll(clinic_subscribe_list);

    for (var i = 0; i < clinic_subscribe_masterList.length; i++) {
      totalBalance.value = totalBalance.value +
          double.parse(clinic_subscribe_masterList[i].subscriptionAmount);
    }
  }

  getClients() async {
    clients.assignAll(await DashboardApi.getClients());
    clients_masterList.assignAll(clients);
  }

  searchClinicPending({required String value}) {
    if (value.isEmpty || value.trim().toString() == "") {
      dentalClinic_pending.assignAll(dentalClinic_pending_masterList);
    } else {
      dentalClinic_pending.assignAll(dentalClinic_pending_masterList
          .where((u) => (u.clinicName
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase())))
          .toList());
    }
  }

  searchDentalApproved({required String value}) {
    if (value.isEmpty || value.trim().toString() == "") {
      dentalClinic_approved.assignAll(dentalClinic_approved_masterList);
    } else {
      dentalClinic_approved.assignAll(dentalClinic_approved_masterList
          .where((u) => (u.clinicName
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase())))
          .toList());
    }
  }

  searchClients({required String value}) {
    if (value.isEmpty || value.trim().toString() == "") {
      clients.assignAll(clients_masterList);
    } else {
      clients.assignAll(clients_masterList
          .where((u) => (u.clientName
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase())))
          .toList());
    }
  }

  searchSubscribeClinic({required String value}) {
    if (value.isEmpty || value.trim().toString() == "") {
      clinic_subscribe_list.assignAll(clinic_subscribe_masterList);
    } else {
      clinic_subscribe_list.assignAll(clinic_subscribe_masterList
          .where((u) => (u.clinicName
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase())))
          .toList());
    }
  }

  updateClinicStatus({required String status, required String clinicID}) async {
    bool isSuccess =
        await DashboardApi.updateStatus(clinicID: clinicID, status: status);
    getPendingDentalClinic();
    getApprovedDentalClinic();
    if (isSuccess == true) {
      if (status == "Approved") {
        Get.snackbar(
          "Message",
          "Clinic Accepted",
          colorText: Colors.white,
          backgroundColor: Colors.lightGreen,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (status == "Denied") {
        Get.snackbar(
          "Message",
          "Clinic Denied",
          colorText: Colors.white,
          backgroundColor: Colors.lightGreen,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Message",
          "Clinic Remove",
          colorText: Colors.white,
          backgroundColor: Colors.lightGreen,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {}
  }

  deleteClient({required String clientID}) async {
    bool isDeleted = await DashboardApi.deleteClient(clientID: clientID);
    if (isDeleted == true) {
      Get.snackbar(
        "Message",
        "Succesfully Deleted",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      getClients();
    } else {}
  }

  update_account() async {
    bool isSuccess = await DashboardApi.updateAccount(
        name: account_name.text,
        username: account_username.text,
        password: account_password.text,
        empID: Get.find<StorageServices>().storage.read('empId'));
    if (isSuccess == true) {
      Get.find<StorageServices>().saveCredentials(
          empId: Get.find<StorageServices>().storage.read('empId'),
          empName: account_name.text,
          empUsername: account_username.text,
          empPass: account_password.text,
          empPosition: Get.find<StorageServices>().storage.read('empPosition'));
      Get.snackbar(
        "Message",
        "Succesfully Updated",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {}
  }
}
