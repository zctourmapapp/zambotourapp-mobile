import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zambotourapp/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:zambotourapp/Login/View/log_in.dart';
import 'package:zambotourapp/Signup/View/sign_up.dart';
import 'package:zambotourapp/Recovery/View/account_recovery.dart';
import 'package:zambotourapp/Account/View/account_view.dart';
import 'package:zambotourapp/Home/View/home_view.dart';
import 'package:zambotourapp/Tourist/View/tourist_view.dart';
import 'package:zambotourapp/Restaurant/View/restuarant_view.dart';
import 'package:zambotourapp/Hotel/View/hotel_view.dart';
import 'package:zambotourapp/Restaurant/Controller/restaurant_controller.dart';
import 'package:zambotourapp/Hotel/Controller/hotel_controller.dart';
import 'package:zambotourapp/Tourist/Controller/tourist_spot_controller.dart';
import 'package:zambotourapp/Account/Controller/authentication_controller.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(Authentication());
  Get.put(RestaurantController());
  Get.put(HotelController());
  Get.put(TouristSpotController());

  runApp(const TravelApp());
  FlutterNativeSplash.remove();
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Text('Home'),
      getPages: [
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/signup', page: () => const Signup()),
        GetPage(name: '/recover', page: () => const AccountRecovery()),
        GetPage(name: '/account', page: () => const Account()),
        GetPage(name: '/home', page: () => const Home()),
        GetPage(name: '/resturant', page: () => const Restaurant()),
        GetPage(name: '/tourist', page: () => const Tourist()),
        GetPage(name: '/hotel', page: () => const Hotel()),
      ],
    );
  }
}
