import 'package:dentalclinic/pages/web_clinic_home/api/web_clinic_home_api.dart';
import 'package:dentalclinic/services/storage_services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/web_clinic_home_model.dart';

class WebClinicController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxString selectedMonth = "Default".obs;
  RxList<ApprovedList> homeApproveList_masterList = <ApprovedList>[].obs;
  RxList<ApprovedList> homeApproveList = <ApprovedList>[].obs;

  RxList<DentistList> dentistList = <DentistList>[].obs;

  RxList<ServicesList> servicesList = <ServicesList>[].obs;

  RxList<AppointmentList> approveList = <AppointmentList>[].obs;
  RxList<AppointmentList> pendingList = <AppointmentList>[].obs;

  RxList<RemarksList> remarksList = <RemarksList>[].obs;

  RxList<WalkinList> walkinList = <WalkinList>[].obs;
  RxDouble totalAmount = 0.0.obs;
  RxDouble totalwalkinAmount = 0.0.obs;
  Rx<ServicesList> initialValue = ServicesList(
          servicesId: "",
          servicesName: "".obs,
          servicesClinicId: "",
          servicesPrice: "",
          servicesDescription: "",
          servicesStatus: "")
      .obs;
  RxString servicesName = "".obs;
  RxString servicesprice = "".obs;

  RxString selectedClient = "".obs;
  RxString selectedClientID = "".obs;
  RxString selectedFCMtoken = "".obs;
  @override
  void onInit() async {
    await getApproveReservations();
    await getServices();
    await getDentist();
    await getAppointments();
    await getWalkin();
    super.onInit();
  }

  RxList months = [
    "Default",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "Novermber",
    "December",
  ].obs;

  @override
  void onClose() {
    super.onClose();
  }

  getApproveReservations() async {
    var result = await WebApiClinicApi.approvedDetails(
        clinicID: Get.find<StorageServices>().storage.read('clinicId'));
    homeApproveList.assignAll(result);
    homeApproveList_masterList.assignAll(result);
    countTotal();
  }

  countTotal() {
    totalAmount.value = 0.0;
    for (var i = 0; i < homeApproveList.length; i++) {
      totalAmount.value =
          totalAmount.value + double.parse(homeApproveList[i].resServicePrice);
    }
  }

  filterMonth({required int month}) {
    homeApproveList.clear();
    if (month != 0) {
      for (var i = 0; i < homeApproveList_masterList.length; i++) {
        if (DateFormat.M()
                .format(homeApproveList_masterList[i].resSchedule)
                .toString() ==
            month.toString()) {
          homeApproveList.add(homeApproveList_masterList[i]);
        } else {}
      }
    } else {
      homeApproveList.assignAll(homeApproveList_masterList);
    }
    countTotal();
  }

  getServices() async {
    var result = await WebApiClinicApi.getServices(
        clinicID: Get.find<StorageServices>().storage.read('clinicId'));
    servicesList.assignAll(result);
    if (servicesList.length != 0) {
      initialValue.value = servicesList[0];
      servicesName.value = servicesList[0].servicesName.value;
      servicesprice.value = servicesList[0].servicesPrice;
    }
  }

  uploadServices({
    required String servicesID,
    required String servicesName,
    required String servicesPrice,
    required String servicesDescription,
  }) async {
    await WebApiClinicApi.uploadServices(
        servicesID: servicesID,
        servicesName: servicesName,
        servicesPrice: servicesPrice,
        servicesDescription: servicesDescription);
    getServices();
  }

  getDentist() async {
    var result = await WebApiClinicApi.getDentist(
        clinicID: Get.find<StorageServices>().storage.read('clinicId'));
    dentistList.assignAll(result);
  }

  getAppointments() async {
    List<AppointmentList> res = await WebApiClinicApi.getAppointments();
    var result = res.reversed.toList();
    for (var i = 0; i < result.length; i++) {
      if (result[i].resStatus == "Approved") {
        approveList.add(result[i]);
      } else if (result[i].resStatus == "Pending") {
        pendingList.add(result[i]);
      }
    }
  }

  updateAppointmentStatus({
    required String resID,
    required String remarks,
    required String status,
  }) async {
    await WebApiClinicApi.updateStatus(
        resID: resID, remarks: remarks, status: status);
    getAppointments();
  }

  sendNotification({
    required String userToken,
    required String service,
    required String date,
    required String time,
    required String clinic,
    required String status,
  }) async {
    await WebApiClinicApi.sendNotification(
        userToken: userToken,
        service: service,
        date: date,
        time: time,
        clinic: clinic,
        status: status);
  }

  sendNotificationForReminder(
      {required String userToken, required String message}) async {
    await WebApiClinicApi.sendNotificationForReminder(
        userToken: userToken,
        clinic: Get.find<StorageServices>().storage.read('clinicName'),
        message: message);
  }

  getWalkin() async {
    var result = await WebApiClinicApi.getWalkins();
    walkinList.assignAll(result);
    totalwalkinAmount.value = 0.0;
    for (var i = 0; i < walkinList.length; i++) {
      totalwalkinAmount.value =
          totalwalkinAmount.value + double.parse(walkinList[0].servicePrice);
    }
  }

  createWalkin({
    required String patient_name,
    required String service_name,
    required String service_price,
    required String contactno,
    required String email,
    required String address,
  }) async {
    Get.back();

    await WebApiClinicApi.createWalkin(
        patient_name: patient_name,
        service_name: service_name,
        service_price: service_price,
        clinic_id: Get.find<StorageServices>().storage.read('clinicId'),
        clinic_name: Get.find<StorageServices>().storage.read('clinicName'),
        time: DateFormat.jm().format(DateTime.now()),
        contactno: contactno,
        email: email,
        address: address);
    getWalkin();
  }

  createDentist({
    required String dentist_name,
    required String dentist_contact,
    required String dentist_email,
  }) async {
    Get.back();
    await WebApiClinicApi.createDentist(
        dentist_name: dentist_name,
        dentist_contact: dentist_contact,
        dentist_email: dentist_email);
    getDentist();
  }

  createService({
    required String services_name,
    required String services_price,
    required String services_description,
  }) async {
    Get.back();
    await WebApiClinicApi.createServices(
        services_name: services_name,
        services_price: services_price,
        services_description: services_description);
    getServices();
  }

  getClientRemarks({required String clientID}) async {
    var result = await WebApiClinicApi.getClientRemarks(clientID: clientID);
    remarksList.assignAll(result);
  }

  createRemarks({
    required String clientID,
    required String remarks,
  }) async {
    Get.back();
    await WebApiClinicApi.createRemarks(
      clientID: clientID,
      remarks: remarks,
    );
    getClientRemarks(clientID: clientID);
  }

  sendNotificationRequest() async {
    await WebApiClinicApi.sendNotificationReminder(
      userToken: selectedFCMtoken.value,
      message:
          "${Get.find<StorageServices>().storage.read('clinicName')} wants to view your past records. Please set your permissions on the records setting to visible.",
    );
  }
}
