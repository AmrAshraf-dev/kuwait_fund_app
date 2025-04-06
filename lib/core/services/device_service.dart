import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';


@singleton
class DeviceService {
  // Singleton instance
  static final DeviceService _instance = DeviceService._internal();

  // Static fields for device information
  static AndroidDeviceInfo? androidInfo;
  static IosDeviceInfo? iosInfo;

  // Private constructor
  DeviceService._internal();

  // Factory constructor
  factory DeviceService() {
    return _instance;
  }

  /// Initialize device information once
  static Future<void> initialize() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        androidInfo = await deviceInfoPlugin.androidInfo;
      } else if (Platform.isIOS) {
        iosInfo = await deviceInfoPlugin.iosInfo;
      }
    } catch (e) {
      print("Error initializing DeviceService: $e");
    }
  }

  /// Retrieve device ID
  String? getDeviceId() {
    if (Platform.isAndroid && androidInfo != null) {
      return androidInfo!.id; // Unique ID for Android
    } else if (Platform.isIOS && iosInfo != null) {
      return iosInfo!.identifierForVendor; // Unique ID for iOS
    }
    return null; // Unsupported platform or uninitialized
  }

  /// Retrieve device model
  String? getDeviceModel() {
    if (Platform.isAndroid && androidInfo != null) {
      return androidInfo!.model; // Device model for Android
    } else if (Platform.isIOS && iosInfo != null) {
      return iosInfo!.utsname.machine; // Device model for iOS
    }
    return null; // Unsupported platform or uninitialized
  }

  /// Retrieve device OS version
  String? getDeviceOsVersion() {
    if (Platform.isAndroid && androidInfo != null) {
      return androidInfo!.version.release; // OS version for Android
    } else if (Platform.isIOS && iosInfo != null) {
      return iosInfo!.systemVersion; // OS version for iOS
    }
    return null; // Unsupported platform or uninitialized
  }
}
