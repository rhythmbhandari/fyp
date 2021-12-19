import 'package:get/get.dart';
import 'package:quicki/app/data/repositories/session_manager.dart';
import 'package:quicki/app/utils/image_byte_converter.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _loadIcons();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<void> _loadIcons() async {
    final _pickupIcon = await ImageByteConverter.getBytesFromAsset(
        'assets/images/user_location.png', 80);
    final _destinationIcon = await ImageByteConverter.getBytesFromAsset(
        'assets/images/destination.png', 80);
    final _bikeIcon = await ImageByteConverter.getBytesFromAsset(
        'assets/motorcycle.png', 120);
    final _carIcon =
    await ImageByteConverter.getBytesFromAsset('assets/car.png', 120);
    final _citySafariIcon = await ImageByteConverter.getBytesFromAsset(
        'assets/city_safari.png', 120);
    final _foodIcon =
    await ImageByteConverter.getBytesFromAsset('assets/food.png', 120);
    final _ambulanceIcon =
    await ImageByteConverter.getBytesFromAsset('assets/ambulance.png', 120);
    final _medicalIcon =
    await ImageByteConverter.getBytesFromAsset('assets/pharmacy.png', 120);
    SessionManager.instance.setMapIcons(
        _pickupIcon,
        _destinationIcon,
        _bikeIcon,
        _carIcon,
        _citySafariIcon,
        _foodIcon,
        _ambulanceIcon,
        _medicalIcon);
  }
}
