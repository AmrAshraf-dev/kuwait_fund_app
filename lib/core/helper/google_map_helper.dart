import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kf_ess_mobile_app/core/constants/map_constants.dart';

import '../../features/di/dependency_init.dart';
import '../routes/routes.dart';
import 'view_toolbox.dart';

class GoogleMapHelper {
  static Circle circle = const Circle(circleId: CircleId('dottedCircle'));
  static Polyline polyline = const Polyline(
    polylineId: PolylineId('dottedPolyLine'),
  );
  static Set<Polyline> polylines = <Polyline>{};

  static String mapStyle = "";

  // Haversine formula to calculate the distance between two points
  double calculateDistance(lat1, lon1, lat2, lon2) {
    const int R = 6371000; // Radius of the Earth in meters
    double dLat = _degToRad(lat2 - lat1);
    double dLon = _degToRad(lon2 - lon1);
    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degToRad(lat1)) *
            math.cos(_degToRad(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return R * c; // Distance in meters
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition({
    required LocationSettings locationSettings,
  }) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ViewsToolbox.showCustomDialog(
        dialogContext: getIt<AppRouter>().navigatorKey.currentContext!,
        getDialogContext: (BuildContext dialogContext) {},
        widgets: <Widget>[
          Text(
              'Location permissions are permanently denied, please allow the app to access location'),
          ElevatedButton(
            onPressed: () {
              Navigator.of(getIt<AppRouter>().navigatorKey.currentContext!)
                  .pop();
            },
            child: Text('OK'),
          ),
          // open app settings
          ElevatedButton(
            onPressed: () async {
              Navigator.of(getIt<AppRouter>().navigatorKey.currentContext!)
                  .pop();
              await Geolocator.openLocationSettings();
            },
            child: Text('Open Settings'),
          ),
        ],
      );

      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        locationSettings: locationSettings);
  }

  double _degToRad(double deg) {
    return deg * (math.pi / 180);
  }

  static LatLng calculateNewCoordinates(
      double lat, double lon, double radiusInMeters, double angleInDegrees) {
    // Convert angle from degrees to radians
    double PI = 3.141592653589793238;

    double angleInRadians = angleInDegrees * PI / 180;

    // Constants for Earth's radius and degrees per meter
    const int earthRadiusInMeters =
        6371000; // Approximate Earth radius in meters
    const double degreesPerMeterLatitude = 1 / earthRadiusInMeters * 180 / pi;
    final double degreesPerMeterLongitude =
        1 / (earthRadiusInMeters * cos(lat * PI / 180)) * 180 / pi;

    // Calculate the change in latitude and longitude in degrees
    double degreesOfLatitude = radiusInMeters * degreesPerMeterLatitude;
    double degreesOfLongitude = radiusInMeters * degreesPerMeterLongitude;

    // Calculate the new latitude and longitude
    double newLat = lat + degreesOfLatitude * sin(angleInRadians);
    double newLon = lon + degreesOfLongitude * cos(angleInRadians);
    return LatLng(newLat, newLon);
  }

  static String getMapStyle() {
    return '[{"featureType":"poi","stylers":[{"visibility":"off"}]},{"featureType":"transit","stylers":[{"visibility":"off"}]}]';
  }

  static initCircles() {
    circle = Circle(
      circleId: const CircleId('dottedCircle'),
      center: const LatLng(29.9140878, 31.0534746),
      radius: MapConstants.googleMapRadius,
      strokeWidth: 0,
      fillColor: Colors.blueAccent.withOpacity(.25),
    );
    polyline = Polyline(
      polylineId: const PolylineId('dottedCircle'),
      color: Colors.blue,
      width: 3,
      patterns: <PatternItem>[
        PatternItem.dash(20),
        PatternItem.gap(15),
      ],
      points: List<LatLng>.generate(
          360,
          (int index) => calculateNewCoordinates(
              MapConstants.companyLocation.latitude,
              MapConstants.companyLocation.longitude,
              MapConstants.googleMapRadius,
              double.parse(index.toString()))),
    );

    polylines.add(polyline);
  }

  static loadMapStyle() {
    rootBundle
        .loadString('assets/json/map_dark_style.json')
        .then((String string) {
      mapStyle = string;
    });
  }
}
