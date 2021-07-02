import 'package:flutter/foundation.dart';
import 'dart:io';

class PlaceLocation {
  final double lattitude;
  final double longitude;
  final String address;

  PlaceLocation({
    @required this.lattitude,
    this.address,
    @required this.longitude,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
