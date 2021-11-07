import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Charger {
  Charger(
      {required this.id,
      required this.name,
      required this.latLng,
      required this.socketType});

  final String id;
  final String name;
  final LatLng latLng;
  final String socketType;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'latidue': latLng.latitude,
      'longitude': latLng.longitude,
      'socketType': socketType
    };
  }

  static Charger fromMap(Map<String, dynamic> map) {
    return Charger(
      id: map['id'] as String,
      name: map['name'] as String,
      latLng: LatLng(map['latitude'] as double, map['longitude'] as double),
      socketType: map['socketType'],
    );
  }

  String toJson() => json.encode(toMap());

  static Charger fromJson(Map<String, dynamic> modelAsMap) =>
      fromMap(modelAsMap);
}
