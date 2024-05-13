import 'package:zambotourapp/Account/controller/authentication_controller.dart';
import 'package:get/get.dart';
import 'package:zambotourapp/Hotel/controller/hotel_controller.dart';
import 'package:zambotourapp/Restaurant/controller/restaurant_controller.dart';
import 'package:zambotourapp/Tourist/controller/tourist_spot_controller.dart';

class BindingsController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Authentication>(() => Authentication());
    Get.lazyPut<HotelController>(() => HotelController());
    Get.lazyPut<RestaurantController>(() => RestaurantController());
    Get.lazyPut<TouristSpotController>(() => TouristSpotController());
  }
}
