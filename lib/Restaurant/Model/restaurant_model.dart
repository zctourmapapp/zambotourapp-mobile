import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zambotourapp/util/geopoint_convertion.dart';
import 'package:zambotourapp/util/num_convertion.dart';

class RestaurantModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final LatLng? location;

  const RestaurantModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    this.location,
  });

  RestaurantModel.fromJson(Map<String, dynamic> res, String id)
      : this(
            id: id,
            title: res['title'] as String,
            description: res['description'] as String,
            imageUrl: res['imageUrl'] as String,
            rating: convertRating(res['rating']),
            location: convertGeoPoint(res['location'] as GeoPoint));
}
