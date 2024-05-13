import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zambotourapp/Hotel/Model/hotel_model.dart';

import 'package:zambotourapp/Tourist/Model/activity_model.dart';
import 'package:zambotourapp/Restaurant/Model/restaurant_model.dart';

const LatLng currentLocation = LatLng(6.9136, 122.0614);

const LatLng dest1 = LatLng(6.9006, 122.0614);

class HotelMapPage extends StatelessWidget {
  const HotelMapPage({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final HotelModel activity;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _MapPageState(activity: activity),
    ]);
  }
}

class HotelPage extends StatelessWidget {
  const HotelPage({
    Key? key,
    required this.hotel,
  }) : super(key: key);
  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _RestoMapPageState(hotel: hotel),
    ]);
  }
}

class _MapPageState extends StatelessWidget {
  _MapPageState({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final HotelModel activity;

  _MapPageState createState() => _MapPageState(activity: activity);

  late LatLng location1 = activity.location;
  late GoogleMapController _mapController;
  Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Map Page"),
            backgroundColor: const Color(0xFF231955),
          ),
          body: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 16,
            ),
            onMapCreated: (controller) {
              _mapController:
              controller;

              addMarker('test', currentLocation);
            },
            markers: _markers.values.toSet(),
          ),
        ),
      ),
    );
  }

  addMarker(String id, LatLng location) {
    var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: const InfoWindow(
          title: 'Shet',
          snippet: 'Description of the Place',
        ));
    _markers[id] = marker;
    _MapPageState(activity: activity);
  }
}

class _RestoMapPageState extends StatelessWidget {
  _RestoMapPageState({
    Key? key,
    required this.hotel,
  }) : super(key: key);
  final HotelModel hotel;

  _RestoMapPageState createState() => _RestoMapPageState(hotel: hotel);

  late LatLng? location1 = hotel.location;
  late GoogleMapController _mapController;
  Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Map Page"),
            backgroundColor: const Color(0xFF231955),
          ),
          body: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 16,
            ),
            onMapCreated: (controller) {
              _mapController:
              controller;

              addMarker('test', currentLocation);
            },
            markers: _markers.values.toSet(),
          ),
        ),
      ),
    );
  }

  addMarker(String id, LatLng location) {
    var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: const InfoWindow(
          title: 'Shet',
          snippet: 'Description of the Place',
        ));
    _markers[id] = marker;
    _RestoMapPageState(hotel: hotel);
  }
}
