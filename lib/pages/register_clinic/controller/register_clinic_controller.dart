import 'dart:async';
import 'dart:convert';
// import 'dart:io';
import 'dart:typed_data';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import '../api/register_clinic_api.dart';

class RegisterClinicController extends GetxController {
  RxList<Marker> markers = <Marker>[].obs;
  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;

  TextEditingController clinic_name = TextEditingController();
  TextEditingController clinic_email = TextEditingController();
  TextEditingController clinic_address = TextEditingController();
  TextEditingController clinic_contact = TextEditingController();
  TextEditingController clinic_username = TextEditingController();
  TextEditingController clinic_password = TextEditingController();

  String verifIDReceived = "";

  LatLng latlng = LatLng(0.0, 0.0);
  String fcmToken = "";

  // FirebaseAuth auth = FirebaseAuth.instance;

  XFile? imageFile;
  RxString imagePath = "".obs;

  XFile? imageFileBir;
  RxString imagePathBir = "".obs;

  XFile? imageFileBusinessPermit;
  RxString imagePathBusinessPermit = "".obs;

  XFile? imageFileDTIPermit;
  RxString imagePathDTIPermit = "".obs;

  XFile? imageFilePhilGeps;
  RxString imagePathPhilGeps = "".obs;

  RxString dentist = "".obs;

  final ImagePicker picker = ImagePicker();

  final ImagePickerWeb pickerWeb = ImagePickerWeb();

  RxBool isCreating = false.obs;

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  addMarker({
    required LatLng latlng,
  }) {
    markers.clear();
    markers.add(Marker(
      markerId: MarkerId(latlng.toString()),
      position: latlng,
    ));
  }

  getImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFile = image;
      imagePath.value = image.path;
      print("path: ${imagePath.value}");
    } else {}
  }

  getImageBir() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFileBir = image;
      imagePathBir.value = image.path;
      print("path: ${imagePath.value}");
    } else {}
  }

  getImageDTI() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFileDTIPermit = image;
      imagePathDTIPermit.value = image.path;
      print("path: ${imagePath.value}");
    } else {}
  }

  getImageBusinessPermit() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFileBusinessPermit = image;
      imagePathBusinessPermit.value = image.path;
      print("path: ${imagePath.value}");
    } else {}
  }

  getImagePhilGeps() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFilePhilGeps = image;
      imagePathPhilGeps.value = image.path;
      print("path: ${imagePath.value}");
    } else {}
  }

  createClinicAccount() async {
    isCreating(true);
    var clinicID = await RegisterClinicApi.createClinicAccount(
        clinic_name: clinic_name.text,
        clinic_username: clinic_username.text,
        clinic_password: clinic_password.text,
        clinic_address: clinic_address.text,
        clinic_lat: latlng.latitude.toString(),
        clinic_long: latlng.longitude.toString(),
        clinic_image: imageFile!.name,
        clinic_email: clinic_email.text,
        clinic_contact_no: clinic_contact.text);
    await uploadImage();

    await createDocuments(clinicId: clinicID);
  }

  uploadImage() async {
    Uint8List bytesImages = await imageFile!.readAsBytes();
    String base64Image = base64Encode(bytesImages);
    await RegisterClinicApi.newRequest(
        filename: imageFile!.name, base64Image: base64Image);
  }

  createDocuments({required String clinicId}) async {
    //BIR
    await RegisterClinicApi.newRequest(
        filename: imageFileBir!.name,
        base64Image: base64Encode(await imageFileBir!.readAsBytes()));
    await RegisterClinicApi.createClinicDocuments(
        clinicid: clinicId,
        clinic_document_name: imageFileBir!.name,
        clinic_document_descritpion: "BIR permit");

    //Business permit
    await RegisterClinicApi.newRequest(
        filename: imageFileBusinessPermit!.name,
        base64Image:
            base64Encode(await imageFileBusinessPermit!.readAsBytes()));
    await RegisterClinicApi.createClinicDocuments(
        clinicid: clinicId,
        clinic_document_name: imageFileBusinessPermit!.name,
        clinic_document_descritpion: "Business permit");

    //DTI permit
    await RegisterClinicApi.newRequest(
        filename: imageFileDTIPermit!.name,
        base64Image: base64Encode(await imageFileDTIPermit!.readAsBytes()));
    await RegisterClinicApi.createClinicDocuments(
        clinicid: clinicId,
        clinic_document_name: imageFileDTIPermit!.name,
        clinic_document_descritpion: "DTI permit");

    //PhilGeps permit
    await RegisterClinicApi.newRequest(
        filename: imageFilePhilGeps!.name,
        base64Image: base64Encode(await imageFilePhilGeps!.readAsBytes()));
    await RegisterClinicApi.createClinicDocuments(
        clinicid: clinicId,
        clinic_document_name: imageFilePhilGeps!.name,
        clinic_document_descritpion: "DTI permit");
    isCreating(false);
    Get.back();
    Get.snackbar(
      "Message",
      "Account succesfuly created",
      colorText: Colors.white,
      backgroundColor: Color.fromARGB(255, 152, 206, 231),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // verifiyNumber() {
  //   auth.verifyPhoneNumber(
  //       // phoneNumber: "09367325510",
  //       phoneNumber: "+63${clinic_contact.text}",
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await auth.signInWithCredential(credential).then((value) {
  //           print("You are login successfully");
  //           print(value.credential);
  //           print("smsCode: ${credential.smsCode}");
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException exception) {
  //         print(exception.message);
  //       },
  //       codeSent: (String verificationID, int? resendToken) {
  //         verifIDReceived = verificationID;
  //         print(verificationID);
  //         print(resendToken);
  //       },
  //       codeAutoRetrievalTimeout: (String verificationID) {},
  //       timeout: Duration(seconds: 60));
  // }

  // void signInWithPhoneAuthCredential(
  //     PhoneAuthCredential phoneAuthCredential, context) async {
  //   try {
  //     final authCredential =
  //         await auth.signInWithCredential(phoneAuthCredential);

  //     if (authCredential.user != null) {
  //       // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
  //       uploadImage();
  //       // controller.addUser(context);
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //   }
  // }
}
