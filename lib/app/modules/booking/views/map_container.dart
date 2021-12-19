import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quicki/app/modules/booking/controllers/booking_map_controller.dart';

class MapContainer extends StatefulWidget {
  @override
  _MapContainerState createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer>
    with WidgetsBindingObserver {
  BookingMapController controller = Get.find();

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
    return GetBuilder<BookingMapController>(
      builder: (myController) => Obx(
        () => GoogleMap(
          initialCameraPosition:
              CameraPosition(zoom: 10, target: LatLng(27.01234, 85.1234)),
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          onCameraMove: (data) {
            controller.updateLastCameraLocation(
                LatLng(data.target.latitude, data.target.longitude));
            controller.updatePlaceName('${"Searching"}...');
          },
          onCameraIdle: () {
            controller.updateCameraStatus();
          },
          compassEnabled: false,
          mapType: MapType.normal,
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
