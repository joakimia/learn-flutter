
import 'package:app/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:app/services/charge_points/charge_points_service.dart';

const LatLng osloLatLngLocation = LatLng(59.9139, 10.7522);
const double defaultZoomLevel = 11.5;

const CameraPosition defaultCameraPosition =
    CameraPosition(target: osloLatLngLocation, zoom: defaultZoomLevel);

class ChargePointsMap extends StatefulWidget {
  const ChargePointsMap({Key? key}) : super(key: key);

  @override
  _ChargePointsMapState createState() => _ChargePointsMapState();
}

class _ChargePointsMapState extends State<ChargePointsMap> {
  Set<Marker> _chargerMarkers = {};
  final Completer<GoogleMapController> _googleMapController = Completer();
  static CameraPosition _currentPostion = defaultCameraPosition;
  final ChargePointsService _chargePointsService = getIt<ChargePointsService>();

  @override
  void initState() {
    super.initState();
    _getChargers();
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) => 
    GoogleMap(
      onMapCreated: (GoogleMapController controller) => _googleMapController.complete(controller),
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      markers: _chargerMarkers,
      initialCameraPosition: _currentPostion,
      onTap: (LatLng _) => _chargePointsService.setSelectedChargePoint(null),
    );

  void _getUserLocation() async {
    var position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPostion = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: defaultZoomLevel,
      );
    });

    await animateToCameraPosition(_currentPostion);
  }

  void _getChargers() async {
    var chargers = await _chargePointsService.getChargerMarkers();

    setState(() {
      _chargerMarkers = chargers;
    });
  }

  Future<void> animateToCameraPosition(CameraPosition position) async {
    var controller = await _googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }
}
