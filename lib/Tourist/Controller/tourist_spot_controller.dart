import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zambotourapp/Tourist/Model/activity_model.dart';

class TouristSpotController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxList<Activity> list = RxList<Activity>([]).obs();

  String restaurantCollection = 'tourist_spots_tbl';

  @override
  void onInit() {
    initStream();
    super.onInit();
  }

  void initStream() {
    list.bindStream(restaurantStream());
  }

  Stream<List<Activity>> restaurantStream() {
    List<Activity> localList = [];

    Stream<QuerySnapshot> snapshots =
        firestore.collection(restaurantCollection).snapshots();

    snapshots.listen((event) {
      if (event.docs.isNotEmpty) {
        localList.clear();
      }
    });

    return snapshots.map((data) {
      for (var value in data.docs) {
        localList.add(
            Activity.fromJson(value.data() as Map<String, dynamic>, value.id));
      }

      return localList.toList();
    });
  }
}
