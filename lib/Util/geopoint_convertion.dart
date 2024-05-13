import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

LatLng convertGeoPoint(GeoPoint p) => LatLng(p.latitude, p.longitude);

GeoPoint convertLatLngGeoPoint(LatLng l) => GeoPoint(l.latitude, l.longitude);