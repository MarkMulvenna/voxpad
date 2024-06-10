import 'dart:io';
import 'package:network_info_plus/network_info_plus.dart';

class NetworkService {
  static Future<String> getIPAddress() async {
    try {
      final networkInfo = NetworkInfo();
      if (Platform.isAndroid || Platform.isIOS) {
        final wifiName = await networkInfo.getWifiName();
        final wifiIP = await networkInfo.getWifiIP();
        if (wifiName != null && wifiIP != null) {
          return wifiIP;
        }
      } else {
        final interfaces = await NetworkInterface.list(
          includeLoopback: false,
          includeLinkLocal: true,
        );
        final interface = interfaces.firstWhere(
              (interface) =>
          interface.name.contains('en') || interface.name.contains('wl'),
        );
        final address = interface.addresses.firstWhere(
              (address) => address.type == InternetAddressType.IPv4,
          orElse: () => InternetAddress('0.0.0.0'), // Return an empty address
        );
        return address.address;
      }
      return 'Unknown';
    } catch (e) {
      throw Exception('Failed to get IP address: $e');
    }
  }
}
