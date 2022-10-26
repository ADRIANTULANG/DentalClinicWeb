import 'package:dentalclinic/configs/class_sizer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../controller/register_clinic_controller.dart';

class RegisterClinicDialog {
  static showOTPdialog(
      {required BuildContext context,
      required RegisterClinicController controller}) {
    Get.dialog(AlertDialog(
      content: Container(
        height: Sizer.height(size: 10, context: context),
        width: Sizer.width(size: 80, context: context),
        child: Container(
          alignment: Alignment.center,
          // child: OtpTextField(
          //   numberOfFields: 6,
          //   borderColor: Colors.lightBlue,
          //   disabledBorderColor: Colors.lightBlue,
          //   enabledBorderColor: Colors.lightBlue,
          //   fillColor: Colors.lightBlue,
          //   focusedBorderColor: Colors.lightBlue,
          //   showFieldAsBox: true,

          //   onCodeChanged: (String code) {},

          //   onSubmit: (String verificationCode) async {
          //     PhoneAuthCredential phoneAuthCredential =
          //         await PhoneAuthProvider.credential(
          //             verificationId: controller.verifIDReceived,
          //             smsCode: verificationCode);

          //     controller.signInWithPhoneAuthCredential(
          //         phoneAuthCredential, context);
          //     // showDialog(
          //     //     context: context,
          //     //     builder: (context) {
          //     //       return AlertDialog(
          //     //         title: Text("Verification Code"),
          //     //         content: Text('Code entered is $verificationCode'),
          //     //       );
          //     //     });
          //   }, // end onSubmit
          // ),
        ),
      ),
    ));
  }
}
