import 'package:dentalclinic/pages/register_clinic/controller/register_clinic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RegistrationGoogleMapsView extends GetView<RegisterClinicController> {
  const RegistrationGoogleMapsView();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(8.485240517340172, 124.6569206256695),
            zoom: 14.4746,
          ),
          onTap: (LatLng latlng) {
            print(latlng);
            controller.addMarker(latlng: latlng);
            controller.latlng = latlng;
          },
          markers: Set<Marker>.of(controller.markers),
          onMapCreated: (GoogleMapController googlemapcontroller) async {
            if (!controller.mapcontroller.isCompleted) {
              controller.mapcontroller.complete(googlemapcontroller);
            }
            controller.googleMapController = await googlemapcontroller;
            // controller.getCenter(
            //     currentLatlng: LatLng(
            //         Get.find<LocationServices>().user_latitude,
            //         Get.find<LocationServices>().user_longitude),
            //     clinicLatlng: LatLng(
            //         double.parse(
            //             controller.clientHomeModel!.clinicLat),
            //         double.parse(
            //             controller.clientHomeModel!.clinicLong)));
          },
        ),
      ),
    );
  }
}
