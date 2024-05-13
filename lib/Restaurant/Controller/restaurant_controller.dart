import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zambotourapp/Restaurant/Model/restaurant_model.dart';

class RestaurantController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxList<RestaurantModel> list = RxList<RestaurantModel>([]).obs();

  String restaurantCollection = 'restaurant_tbl';

  @override
  void onInit() {
    initStream();
    super.onInit();
  }

  void initStream() {
    list.bindStream(restaurantStream());
  }

  Stream<List<RestaurantModel>> restaurantStream() {
    List<RestaurantModel> localList = [];

    Stream<QuerySnapshot> snapshots =
        firestore.collection(restaurantCollection).snapshots();

    snapshots.listen((event) {
      if (event.docs.isNotEmpty) {
        localList.clear();
      }
    });

    return snapshots.map((data) {
      for (var value in data.docs) {
        localList.add(RestaurantModel.fromJson(
            value.data() as Map<String, dynamic>, value.id));
      }

      return localList.toList();
    });
  }
}
