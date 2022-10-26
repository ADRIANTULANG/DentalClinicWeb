import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dentalclinic/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../constant/endPoints.dart';
import '../model/web_clinic_home_model.dart';

class WebApiClinicApi {
  static var client = http.Client();

//
  static Future<List<ApprovedList>> approvedDetails({
    required String clinicID,
  }) async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/get-approved-reservations.php'),
        body: {
          "clinicID": clinicID.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return approvedListFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Clinic Details Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Clinic Details Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "Clinic Details Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

//
  static Future<List<ServicesList>> getServices({
    required String clinicID,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-clinic-services.php'),
        body: {
          "clinicID": clinicID.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return servicesListFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Services Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Services Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "Get Services Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future updateServices({
    required String servicesID,
    required String services_status,
  }) async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/update-clinic-services-status.php'),
        body: {
          "services_id": servicesID.toString(),
          "services_status": services_status.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Update Services Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Update Services Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Update Services Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future uploadServices({
    required String servicesID,
    required String servicesName,
    required String servicesPrice,
    required String servicesDescription,
  }) async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/update-clinic-services-details.php'),
        body: {
          "services_clinic_id":
              Get.find<StorageServices>().storage.read('clinicId'),
          "services_id": servicesID.toString(),
          "services_name": servicesName.toString(),
          "services_price": servicesPrice.toString(),
          "services_description": servicesDescription.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Update Services Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Update Services Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Update Services Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

//
  static Future<List<DentistList>> getDentist({
    required String clinicID,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-clinic-dentist.php'),
        body: {
          "clinicID": clinicID.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return dentistListFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Dentist Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Dentist Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "Get Dentist Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future removeDentist({
    required String dentistID,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/delete-dentist.php'),
        body: {
          "dentistID": dentistID.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Delete Dentist Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Delete Dentist Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Delete Dentist Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

//
  static Future<List<AppointmentList>> getAppointments() async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-clinic-appointments.php'),
        body: {
          "clinicID":
              Get.find<StorageServices>().storage.read('clinicId').toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return appointmentListFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Appointments Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Appointments Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "Get Appointments Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future updateStatus({
    required String resID,
    required String remarks,
    required String status,
  }) async {
    try {
      print(status);
      print(remarks);
      print(resID);
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/update-reservation-appointment.php'),
        body: {
          "resID": resID.toString(),
          "remarks": remarks.toString(),
          "status": status.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Update Appointment Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Update Appointment Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Update Appointment Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future sendNotification({
    required String userToken,
    required String service,
    required String date,
    required String time,
    required String clinic,
    required String status,
  }) async {
    var e2epushnotif = await http.post(
        Uri.parse('${AppEndpoint.endPointDomain}/push-notification.php'),
        body: {
          "fcmtoken": userToken,
          "title": "Message",
          "body": "RESERVATION $status  $clinic - $service - $date - $time"
        });
    print("e2e notif: ${e2epushnotif.body}");
  }

  static Future sendNotificationForReminder({
    required String userToken,
    required String clinic,
    required String message,
  }) async {
    var e2epushnotif = await http.post(
        Uri.parse('${AppEndpoint.endPointDomain}/push-notification.php'),
        body: {
          "fcmtoken": userToken,
          "title": "Message",
          "body": "$message - $clinic"
        });
    print("e2e notif: ${e2epushnotif.body}");
  }

//
  static Future<List<WalkinList>> getWalkins() async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-walkin-transactions.php'),
        body: {
          "clinicID":
              Get.find<StorageServices>().storage.read('clinicId').toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return walkinListFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Walkin Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Walkin Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "Get Walkin Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future createWalkin({
    required String patient_name,
    required String service_name,
    required String service_price,
    required String clinic_id,
    required String clinic_name,
    required String time,
    required String contactno,
    required String email,
    required String address,
  }) async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/create-walkin-transaction.php'),
        body: {
          "clinic_name": clinic_name,
          "patient_name": patient_name.toString(),
          "service_name": service_name.toString(),
          "service_price": service_price.toString(),
          "clinic_id": clinic_id.toString(),
          "time": time.toString(),
          "contactno": contactno.toString(),
          "email": email.toString(),
          "address": address.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Walkin Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Walkin Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Create Walkin Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future createDentist({
    required String positioned,
    required String dentist_name,
    required String dentist_contact,
    required String dentist_email,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-clinic-dentist.php'),
        body: {
          "dentist_position": positioned,
          "dentist_clinic_id":
              Get.find<StorageServices>().storage.read('clinicId'),
          "dentist_name": dentist_name.toString(),
          "dentist_contact": dentist_contact.toString(),
          "dentist_email": dentist_email.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Dentist Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Dentist Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Create Dentist Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future createServices({
    required String services_name,
    required String services_price,
    required String services_description,
  }) async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/create-dental-clinic-services.php'),
        body: {
          "services_clinic_id":
              Get.find<StorageServices>().storage.read('clinicId'),
          "services_name": services_name.toString(),
          "services_price": services_price.toString(),
          "services_description": services_description.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Dentist Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Dentist Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Create Dentist Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

//
  static Future<List<RemarksList>> getClientRemarks(
      {required String clientID}) async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/get-client-remarks-for-clinic.php'),
        body: {
          "clientID": clientID,
          "clinicID": Get.find<StorageServices>().storage.read('clinicId')
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return remarksListFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Client Remarks Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Client Remarks Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "Get Client Remarks Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future createRemarks({
    required String clientID,
    required String remarks,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-client-remarks.php'),
        body: {
          "clinicID": Get.find<StorageServices>().storage.read('clinicId'),
          "clientID": clientID.toString(),
          "remarks": remarks.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Remarks Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Remarks Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Create Remarks Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future sendNotificationReminder({
    required String userToken,
    required String message,
  }) async {
    var e2epushnotif = await http.post(
        Uri.parse('${AppEndpoint.endPointDomain}/push-notification.php'),
        body: {"fcmtoken": userToken, "title": "Message", "body": "$message"});
    print("e2e notif: ${e2epushnotif.body}");
  }

  static Future updateAccount({
    required String username,
    required String password,
    required String clinicName,
    required String clinicEmail,
    required String clinicAddress,
    required String clinicContact,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/update-clinic-account.php'),
        body: {
          "clinicID": Get.find<StorageServices>().storage.read('clinicId'),
          "password": password.toString(),
          "username": username.toString(),
          "clinicName": clinicName.toString(),
          "clinicEmail": clinicEmail.toString(),
          "clinicAddress": clinicAddress.toString(),
          "clinicContact": clinicContact.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Remarks Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Remarks Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Create Remarks Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

//
  static Future<List<AccessLogModel>> getAccesslogs() async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-clinic-access-log.php'),
        body: {
          "clinicID": Get.find<StorageServices>().storage.read('clinicId')
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return accessLogModelFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Access Log Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Access Log Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "Get Access Log Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future createReservationWalkinPatient({
    required String res_service_name,
    required String res_service_price,
    required String res_total_amount,
    required String res_schedule,
    required String res_schedule_time,
    required String res_walkin_client_name,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-reservation.php'),
        body: {
          "res_service_name": res_service_name,
          "res_clinic_id": Get.find<StorageServices>().storage.read('clinicId'),
          "res_service_price": res_service_price.toString(),
          "res_total_amount": res_service_price.toString(),
          "res_schedule": res_schedule.toString(),
          "res_schedule_time": res_schedule_time.toString(),
          "res_walkin_client_name": res_walkin_client_name.toString(),
        },
      );
      print(response.body);
      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Dentist Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Dentist Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Create Dentist Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

//
  static Future<List<NotificationSchedule>> getClientNotificationSchedule(
      {required String clientID}) async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/get-client-notification-schedule.php'),
        body: {
          "clinic_id": Get.find<StorageServices>().storage.read('clinicId'),
          "client_id": clientID
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return notificationScheduleFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Client Notification Schedule Log Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Client Notification Schedule Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "Get Client Notification Schedule Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future createClientNotificationSchedule({
    required String client_name,
    required String client_id,
    required String notif_schedule,
    required String fcmToken,
  }) async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/create-notification-schedule.php'),
        body: {
          "client_name": client_name,
          "client_id": client_id,
          "clinic_id": Get.find<StorageServices>().storage.read('clinicId'),
          "clinic_name": Get.find<StorageServices>().storage.read('clinicName'),
          "notif_schedule": notif_schedule.toString(),
          "fcmToken": fcmToken.toString(),
        },
      );
      print(response.body);
      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Client Notif Schedule Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Client Notif Schedule  Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Create Client Notif Schedule  Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future<List<NotificationSchedule>>
      getClinicNotificationSchedule() async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/get-clinic-notification-schedule.php'),
        body: {
          "clinic_id": Get.find<StorageServices>().storage.read('clinicId'),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return notificationScheduleFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Clinic Notification Schedule Log Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Clinic Notification Schedule Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "Get Clinic Notification Schedule Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future updateNotificationStatus({
    required String notif_id,
  }) async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/update-notification-schedule.php'),
        body: {
          "notif_id": notif_id,
        },
      );
      print(response.body);
      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Update Notif Status Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Update Notif Status Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Update Notif Status  Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future sendNotificationAutomatic({
    required String userToken,
    required String date,
    required String clinic,
  }) async {
    var e2epushnotif = await http.post(
        Uri.parse('${AppEndpoint.endPointDomain}/push-notification.php'),
        body: {
          "fcmtoken": userToken,
          "title": "Message",
          "body":
              "Please be reminded, you will be revisiting $clinic on - $date"
        });
    print("e2e notif: ${e2epushnotif.body}");
  }
}
