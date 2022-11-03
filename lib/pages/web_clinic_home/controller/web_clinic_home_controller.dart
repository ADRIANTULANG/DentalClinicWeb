import 'package:dentalclinic/pages/web_clinic_home/api/web_clinic_home_api.dart';
import 'package:dentalclinic/pages/web_clinic_home/dialog/web_clinic_home_dialog.dart';
import 'package:dentalclinic/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../login_screen/view/login_main.dart';
import '../model/web_clinic_home_model.dart';

class WebClinicController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxString selectedMonth = "Default".obs;
  RxString selectedDay = "Default".obs;
  RxList<ApprovedList> homeApproveList_masterList = <ApprovedList>[].obs;
  RxList<ApprovedList> homeApproveList = <ApprovedList>[].obs;

  RxList<DentistList> dentistList = <DentistList>[].obs;

  RxList<ServicesList> servicesList = <ServicesList>[].obs;

  RxList<AppointmentList> approveList = <AppointmentList>[].obs;
  RxList<AppointmentList> pendingList = <AppointmentList>[].obs;

  RxList<RemarksList> remarksList = <RemarksList>[].obs;

  RxList<WalkinList> walkinList = <WalkinList>[].obs;

  RxList<AccessLogModel> acccessLogsList = <AccessLogModel>[].obs;

  RxList<NotificationSchedule> client_notificationSchedule =
      <NotificationSchedule>[].obs;

  RxList<NotificationSchedule> clinic_notificationSchedule =
      <NotificationSchedule>[].obs;

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

  TextEditingController account_username = TextEditingController();
  TextEditingController account_password = TextEditingController();
  TextEditingController account_address = TextEditingController();
  TextEditingController account_contact = TextEditingController();
  TextEditingController account_email = TextEditingController();
  TextEditingController account_clinicname = TextEditingController();

  RxBool isLoadingRefresh = false.obs;

  RxString initialPosition = "Dentist".obs;

  RxList listofPositions = ['Dentist', 'Secretary', 'Employee'].obs;

  final ImagePicker picker = ImagePicker();

  XFile? imageFile;
  RxString imagePath = ''.obs;

  List minutes = [];
  List hourss = [];

  RxString partialselectedAmPm = "AM".obs;
  RxString partialselectedHour = "01".obs;
  RxString partialselectedMinutes = "00".obs;

  RxBool isCreatingSchedule = false.obs;

  RxBool isSelectingDaily = false.obs;

  RxBool isCheckGcash = false.obs;
  RxBool isPaymaya = false.obs;
  RxString isSelectedPaymentGateway = "".obs;

  @override
  void onInit() async {
    account_username.text =
        Get.find<StorageServices>().storage.read('username').toString();
    account_password.text =
        Get.find<StorageServices>().storage.read('password').toString();
    account_clinicname.text =
        Get.find<StorageServices>().storage.read('clinicName').toString();
    account_address.text =
        Get.find<StorageServices>().storage.read('clinicAddress').toString();
    account_email.text =
        Get.find<StorageServices>().storage.read('clinicEmail').toString();
    account_contact.text =
        Get.find<StorageServices>().storage.read('clinicContactNo').toString();
    getminutes();
    getHours();
    await getApproveReservations();
    await getServices();
    await getDentist();
    await getAppointments();
    await getWalkin();
    await getAccesslogs();
    await getClinicNotificationSchedule();
    getSubscriptionStatus();
    getSubscriptionDates();

    super.onInit();
  }

  onRefresh() async {
    account_username.text =
        Get.find<StorageServices>().storage.read('username').toString();
    account_password.text =
        Get.find<StorageServices>().storage.read('password').toString();

    await getApproveReservations();
    await getServices();
    await getDentist();
    await getAppointments();
    await getWalkin();
    await getAccesslogs();
    await getClinicNotificationSchedule();
  }

  onRefreshRecord() async {
    await getClientRemarks(clientID: selectedClientID.value);
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
    homeApproveList.assignAll(result.reversed.toList());
    homeApproveList_masterList.assignAll(result.reversed.toList());
    countTotal();
  }

  countTotal() {
    totalAmount.value = 0.0;
    for (var i = 0; i < homeApproveList.length; i++) {
      totalAmount.value =
          totalAmount.value + double.parse(homeApproveList[i].resServicePrice!);
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

  filterRange({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    homeApproveList.clear();
    for (var i = 0; i < homeApproveList_masterList.length; i++) {
      if (homeApproveList_masterList[i].resSchedule.isAfter(startDate) ==
              true &&
          homeApproveList_masterList[i].resSchedule.isBefore(endDate) == true) {
        homeApproveList.add(homeApproveList_masterList[i]);
      } else {}
    }
    countTotal();
  }

  filterDaily() {
    homeApproveList.clear();
    var now = DateTime.now();
    if (isSelectingDaily.value == true) {
      for (var i = 0; i < homeApproveList_masterList.length; i++) {
        if (homeApproveList_masterList[i].resSchedule.day == now.day &&
            homeApproveList_masterList[i].resSchedule.month == now.month &&
            homeApproveList_masterList[i].resSchedule.year == now.year) {
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
    servicesList.assignAll(result.reversed.toList());
    if (servicesList.length != 0) {
      initialValue.value = servicesList[0];
      servicesName.value = servicesList[0].servicesName.value;
      servicesprice.value = servicesList[0].servicesPrice;
    }
  }

  updateServices({required String servicesID}) async {
    var result = await WebApiClinicApi.updateServices(
        servicesID: servicesID, services_status: "Inactive");
    if (result == true) {
      getServices();
    } else {}
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
    dentistList.assignAll(result.reversed.toList());
  }

  removeDentist({required String dentistID}) async {
    var result = await WebApiClinicApi.removeDentist(dentistID: dentistID);
    if (result == true) {
      getDentist();
    } else {}
  }

  getAppointments() async {
    approveList.clear();
    pendingList.clear();
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
    await getAppointments();
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
    walkinList.assignAll(result.reversed.toList());
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
    required String positioned,
    required String dentist_name,
    required String dentist_contact,
    required String dentist_email,
  }) async {
    Get.back();
    await WebApiClinicApi.createDentist(
        positioned: positioned,
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

  updateClinicAccount() async {
    var result = await WebApiClinicApi.updateAccount(
        username: account_username.text,
        password: account_password.text,
        clinicAddress: account_address.text,
        clinicContact: account_contact.text,
        clinicEmail: account_email.text,
        clinicName: account_clinicname.text);
    if (result == true) {
      Get.find<StorageServices>()
          .storage
          .write("username", account_username.text);
      Get.find<StorageServices>()
          .storage
          .write("password", account_password.text);
      Get.find<StorageServices>()
          .storage
          .write("clinicName", account_clinicname.text);
      Get.find<StorageServices>()
          .storage
          .write("clinicAddress", account_address.text);
      Get.find<StorageServices>()
          .storage
          .write("clinicEmail", account_email.text);
      Get.find<StorageServices>()
          .storage
          .write("clinicContactNo", account_contact.text);
      Get.snackbar(
        "Message",
        "Account updated.",
        colorText: Colors.white,
        backgroundColor: Color.fromARGB(255, 139, 193, 236),
        snackPosition: SnackPosition.TOP,
      );
    } else {}
  }

  getAccesslogs() async {
    var result = await WebApiClinicApi.getAccesslogs();
    acccessLogsList.assignAll(result);
  }

  getImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFile = image;
      imagePath.value = image.path;
      print("path: ${imagePath.value}");
    } else {}
  }

  createWalkinPatientReservation({
    required String res_service_name,
    required String res_service_price,
    required String res_total_amount,
    required String res_schedule,
    required String res_schedule_time,
    required String res_walkin_client_name,
  }) async {
    await WebApiClinicApi.createReservationWalkinPatient(
        res_service_name: res_service_name,
        res_service_price: res_service_price,
        res_total_amount: res_total_amount,
        res_schedule: res_schedule,
        res_schedule_time: res_schedule_time,
        res_walkin_client_name: res_walkin_client_name);
    await getAppointments();
    Get.back();
  }

  getminutes() {
    int starting = 0;
    for (var i = 0; i < 60; i++) {
      String text = "";
      if (starting.toString().length == 1) {
        text = "0" + starting.toString();
      } else {
        text = starting.toString();
      }
      minutes.add(text);
      starting++;
    }
  }

  getHours() {
    int starting = 1;
    for (var i = 0; i < 12; i++) {
      String text = "";
      if (starting.toString().length == 1) {
        text = "0" + starting.toString();
      } else {
        text = starting.toString();
      }
      hourss.add(text);
      starting++;
    }
  }

  getClientNotificationSchedule({required String clientID}) async {
    var result =
        await WebApiClinicApi.getClientNotificationSchedule(clientID: clientID);
    client_notificationSchedule.assignAll(result.reversed.toList());
  }

  getClinicNotificationSchedule() async {
    var result = await WebApiClinicApi.getClinicNotificationSchedule();
    clinic_notificationSchedule.assignAll(result.reversed.toList());

    for (var i = 0; i < clinic_notificationSchedule.length; i++) {
      if (clinic_notificationSchedule[i].isNotified == "No") {
        var data = clinic_notificationSchedule[i].notifSchedule;
        if (DateTime.now().year == data.year &&
            (data.day - DateTime.now().day) <= 3 &&
            DateTime.now().month == data.month) {
          await WebApiClinicApi.updateNotificationStatus(
              notif_id: clinic_notificationSchedule[i].notifId);
          await WebApiClinicApi.sendNotificationAutomatic(
              userToken: clinic_notificationSchedule[i].fcmToken,
              date: DateFormat.yMMMEd()
                  .format(clinic_notificationSchedule[i].notifSchedule),
              clinic: Get.find<StorageServices>()
                  .storage
                  .read('clinicName')
                  .toString());
          print("must notify");
        } else {
          print("must not notify");
        }
      } else {}
    }
  }

  createClientNotificationSchedule({
    required String client_name,
    required String client_id,
    required String notif_schedule,
    required String fcmToken,
  }) async {
    await WebApiClinicApi.createClientNotificationSchedule(
        client_name: client_name,
        client_id: client_id,
        notif_schedule: notif_schedule,
        fcmToken: fcmToken);
    Get.back();
    getClientNotificationSchedule(clientID: client_id);
    getClinicNotificationSchedule();
  }

  bool isAlreadyRemind = false;
  RxString expirationDate = "".obs;
  RxString subscriptionStatus = "".obs;

  getSubscriptionStatus() async {
    var result = await WebApiClinicApi.getSubscritpionStatus();
    if (result == "Unpaid") {
      expirationDate.value = "Account Inactive";
      isAlreadyRemind = true;
      subscriptionStatus.value = "Unpaid";
      WebClinicHomeDialog.showReminder(context: Get.context!);
    } else if (result == false) {
    } else {}
  }

  getSubscriptionDates() async {
    List<ClinicSubscriptionDates> result =
        await WebApiClinicApi.getClinicSubscriptionDates();
    if (result.isEmpty) {
      expirationDate.value = "Account Inactive";
    } else {
      bool isExpired = result[0].subsExpirationDate.isBefore(DateTime.now());
      if (subscriptionStatus.value == "Unpaid") {
        expirationDate.value = "Account Inactive";
      } else {
        expirationDate.value = "Account Expiration Date: " +
            DateFormat.yMMMMd().format(result[0].subsExpirationDate);
      }
      if (isExpired == true) {
        await WebApiClinicApi.updateClinicStatusToExpired();
        subscriptionStatus.value = "Unpaid";
        if (isAlreadyRemind == false) {
          expirationDate.value = "Account Inactive";
          Get.snackbar("Message",
              "Subscription Expired. Please subscribe again to activate your account. Thank you!",
              colorText: Colors.white,
              backgroundColor: Color.fromARGB(255, 172, 213, 233),
              snackPosition: SnackPosition.TOP,
              duration: Duration(seconds: 4));
        }
      } else {}
      // if(isExpired)
    }
  }

  updateClinicSubscription() async {
    // isSubscribing(true);
    DateTime exp = DateTime.now().add(Duration(days: 30));
    DateTime pur = DateTime.now();

    bool isSuccess = await WebApiClinicApi.updateClinicSubscription(
        amount: 1500.toString(),
        sub_expiration_date: exp.toString(),
        sub_purchased_date: pur.toString());

    if (isSuccess == true) {
      await Get.find<StorageServices>().removeCredentials();
      Get.offAll(() => LoginMain());
      Get.snackbar("Message", "Account Succesfully Activated. Please log in",
          colorText: Colors.white,
          backgroundColor: Color.fromARGB(255, 158, 210, 235),
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 30));
    } else {
      Get.snackbar("Message", "Sorry.. Please try again later",
          colorText: Colors.white,
          backgroundColor: Color.fromARGB(255, 158, 210, 235),
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 30));
    }
    // isSubscribing(false);
  }
}
