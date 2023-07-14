// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place(
      {required this.id,
      required this.title,
      required this.location,
      required this.image});
}

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? address;

  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });

  CameraPosition getCameraPosition({double zoom = 16}) {
    return CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: zoom,
    );
  }
}
