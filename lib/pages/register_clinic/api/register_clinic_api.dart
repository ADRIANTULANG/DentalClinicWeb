import 'dart:async';
import 'dart:convert';
import 'dart:io';
// import 'dart:typed_data';
// import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

import '../../../constant/endPoints.dart';

class RegisterClinicApi {
  static var client = http.Client();
//<List<ClinicDocuments>>
  static Future createClinicAccount({
    required String clinic_name,
    required String clinic_username,
    required String clinic_password,
    required String clinic_address,
    required String clinic_lat,
    required String clinic_long,
    required String clinic_image,
    required String clinic_email,
    required String clinic_contact_no,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-clinic-account.php'),
        body: {
          "clinic_name": clinic_name.toString(),
          "clinic_username": clinic_username.toString(),
          "clinic_password": clinic_password.toString(),
          "clinic_address": clinic_address.toString(),
          "clinic_lat": clinic_lat.toString(),
          "clinic_long": clinic_long.toString(),
          "clinic_image": clinic_image.toString(),
          "clinic_dentist_name": "".toString(),
          "clinic_email": clinic_email.toString(),
          "clinic_contact_no": clinic_contact_no.toString(),
          "fcmToken": "".toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return jsonDecode(response.body)['clinicID'].toString();
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Clinic Account: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Clinic Account: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Create Clinic Account Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future createClinicDocuments({
    required String clinicid,
    required String clinic_document_name,
    required String clinic_document_descritpion,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-clinic-documents.php'),
        body: {
          "clinic_id": clinicid,
          "clinic_img_document": clinic_document_name,
          "clinic_doc_description": clinic_document_descritpion,
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Clinic Documents Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Clinic Documents Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Create Clinic Documents Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future newRequest(
      {required String filename, required String base64Image}) async {
    var response = await http.post(
        Uri.parse(
            "https://dcams.online/dentalClinic/images/image-upload-web.php"),
        body: {"image": base64Image, "name": filename});
    print(response.statusCode);
  }
}
