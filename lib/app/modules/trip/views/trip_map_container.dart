import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quicki/app/data/repositories/session_manager.dart';
import 'package:quicki/app/modules/trip/controllers/trip_map_controller.dart';

class TripMapContainer extends StatefulWidget {
  @override
  _TripMapContainerState createState() => _TripMapContainerState();
}

class _TripMapContainerState extends State<TripMapContainer>
    with WidgetsBindingObserver {
  TripMapController controller = Get.find();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller.updateMapStyle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TripMapController>(
      builder: (myController) =>
          Obx(
            () =>
                GoogleMap(
          initialCameraPosition:
          CameraPosition(zoom: 16, target: SessionManager.instance.currentLocation),
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          compassEnabled: false,
          mapType: MapType.normal,
          padding: EdgeInsets.only(bottom: controller.googlePadding),
          polylines: myController.polylines,
          zoomGesturesEnabled: true,
          // polygons: PolygonPoints.myPolygon(),
          zoomControlsEnabled: false,
          markers: controller.markers.value,
          onMapCreated: (GoogleMapController _controller) {
            controller.updateMapController(_controller);
          },
        ),
      ),
    );
  }
}
