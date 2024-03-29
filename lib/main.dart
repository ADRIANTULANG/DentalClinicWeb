import 'package:dentalclinic/pages/login_screen/view/login_main.dart';
import 'package:dentalclinic/pages/web_clinic_home/view/web_clinic_home_view.dart';
import 'package:dentalclinic/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'pages/dashboard_screen/view/dashboard_view.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.put(StorageServices());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // bool checkIfAlreadyLogin() {
    //   if (Get.find<StorageServices>().storage.read("empId") == null) {
    //     return false;
    //   } else {
    //     return true;
    //   }
    // }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DCAMS',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Get.find<StorageServices>().storage.read("empId") != null
          ? DashBoardView()
          : Get.find<StorageServices>().storage.read("accountId") != null
              ? WebClinicHomeView()
              : LoginMain(),
    );
  }
}
