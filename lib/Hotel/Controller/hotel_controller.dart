import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zambotourapp/Hotel/Model/hotel_model.dart';

class HotelController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxList<HotelModel> list = RxList<HotelModel>([]).obs();

  String restaurantCollection = 'hotel_tbl';

  @override
  void onInit() {
    initStream();
    super.onInit();
  }

  void initStream() {
    list.bindStream(hotelStream());
  }

  Stream<List<HotelModel>> hotelStream() {
    List<HotelModel> localList = [];

    Stream<QuerySnapshot> snapshots =
        firestore.collection(restaurantCollection).snapshots();

    snapshots.listen((event) {
      if (event.docs.isNotEmpty) {
        localList.clear();
      }
    });

    return snapshots.map((data) {
      for (var value in data.docs) {
        localList.add(HotelModel.fromJson(
            value.data() as Map<String, dynamic>, value.id));
      }

      return localList.toList();
    });
  }
}
