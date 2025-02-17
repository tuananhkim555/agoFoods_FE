import 'package:get/get.dart';
import 'package:agofoods/services/location_service.dart';

class LocationController extends GetxController {
  final LocationService _locationService = LocationService();
  final RxString currentAddress = "Đang tải địa chỉ...".obs;

  Future<void> getCurrentLocation() async {
    try {
      final position = await _locationService.getCurrentLocation();
      final address = await _locationService.getAddressFromLatLng(position);
      currentAddress.value = address;
    } catch (e) {
      currentAddress.value = "Không thể lấy địa chỉ";
    }
  }
}
