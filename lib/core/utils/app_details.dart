import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppUtils {
  static Future<String> getAppDetails() async {
    final packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }

  static Future<String> getAppBuildNumber() async {
    final packageInfo = await PackageInfo.fromPlatform();
    String build = packageInfo.buildNumber;
    return build;
  }

  static Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    return position;
  }

  static Future<String> getLocalIpAddress() async {
    final interfaces = await NetworkInterface.list(type: InternetAddressType.IPv4, includeLinkLocal: true);

    try {
      NetworkInterface vpnInterface = interfaces.firstWhere((element) => element.name == "tun0");
      return vpnInterface.addresses.first.address;
    } on StateError {
      try {
        NetworkInterface interface = interfaces.firstWhere((element) => element.name == "wlan0");
        return interface.addresses.first.address;
      } catch (ex) {
        try {
          NetworkInterface interface = interfaces.firstWhere((element) => !(element.name == "tun0" || element.name == "wlan0"));
          return interface.addresses.first.address;
        } catch (ex) {
          return '';
        }
      }
    }
  }

  static Future<String> getAppVersionComplete() async {
    final appDetails = await Future.wait([AppUtils.getAppDetails(), AppUtils.getAppBuildNumber()]);
    final appVersion = 'v${appDetails[0]}+${appDetails[1]}';
    return appVersion;
  }
}
