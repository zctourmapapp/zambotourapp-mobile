import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TouristModel {
  String? _id;
  String? _name;
  String? _address;
  String? _contact;
  LatLng? _latLng;

  TouristModel();

  TouristModel.getDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    _id = documentSnapshot.id;
    _name = documentSnapshot.get('name');
    _address = documentSnapshot.get('address');
    _contact = documentSnapshot.get('contact');
    _latLng = documentSnapshot.get('location');
  }

  /*
    Stream connections
  **/
  TouristModel.getQueryDocumentSnapshot(
      QueryDocumentSnapshot queryDocumentSnapshot) {
    _id = queryDocumentSnapshot.id;
    _name = queryDocumentSnapshot.get('name');
    _address = queryDocumentSnapshot.get('address');
    _contact = queryDocumentSnapshot.get('contact');
    _latLng = queryDocumentSnapshot.get('location');
  }

  String get id => _id ?? '';
  String get name => _name ?? '';
  String get address => _address ?? '';
  String get contact => _contact ?? '';
  LatLng get location => _latLng!;

  set id(String id) => _id = id;
  set name(String name) => _name = name;
  set address(String address) => _address = address;
  set contact(String contact) => _contact = contact;
  set location(LatLng location) => _latLng = location;
}
