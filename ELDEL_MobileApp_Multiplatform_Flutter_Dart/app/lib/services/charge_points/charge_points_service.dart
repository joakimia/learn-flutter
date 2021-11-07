import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:app/models/charge_points/charger_model.dart';
import 'package:app/services/common/settings_service.dart';
import '../service_locator.dart';

class ChargePointsService {
  final SettingsService _settingsService = getIt<SettingsService>();
  final StreamController<Charger?> _chargePointStreamController =
      StreamController<Charger?>();
  List<dynamic> _chargers = [];

  Stream<Charger?> get selectedChargePointStream =>
      _chargePointStreamController.stream;

  void setSelectedChargePoint(Charger? charger) {
    _chargePointStreamController.add(charger);
  }

  Charger getChargerById(String chargerId) =>
      _chargers.single((Charger c) => c.id == chargerId);

  Future<List<dynamic>> getChargers() async {
    try {
      if (_chargers.isEmpty) {
        var uri =
            Uri.parse("${_settingsService.eldelAPIBaseUrl}/api/v1/chargers");
        var header = <String, String>{
          'ApiKey': _settingsService.eldelAPIChargersApiKey
        };
        var response = await http.get(uri, headers: header);
        var jsonResponse = json.decode(response.body);
        _chargers = jsonResponse
            .map((dynamic modelAsJsonMap) => Charger.fromJson(modelAsJsonMap))
            ?.toList();
      }

      return _chargers;
    } on Exception {
      return List.empty();
    }
  }

  Future<Set<Marker>> getChargerMarkers() async {
    try {
      var chargers = await getChargers();
      var chargerMarkers = <Marker>{};
      var chargerMarkerIcon = await getChargerMarkerIconsAsBitmapDescriptor();

      // TODO: Maybe its better to add a 'marker' property inside the Charger model, to reduce loops and complexity of locating / updating markers and chargers.
      for (var charger in chargers) {
        var marker = Marker(
          markerId: MarkerId(charger.id),
          position: charger.latLng,
          icon: chargerMarkerIcon,
          onTap: () => setSelectedChargePoint(charger),
        );

        chargerMarkers.add(marker);
      }

      return chargerMarkers;
    } on Exception {
      return {};
    }
  }

  Future<BitmapDescriptor> getChargerMarkerIconsAsBitmapDescriptor() async {
    return await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0),
        'assets/images/charge_point_marker.png');
  }
}
