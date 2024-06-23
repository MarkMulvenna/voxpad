import 'dart:io';
import 'package:network_info_plus/network_info_plus.dart';

class NetworkService {
  static Future<String> getIPAddress() async {
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        return _getWifiIPAddress();
      } else {
        return _getLocalIPAddress();
      }
    } catch (e) {
      throw Exception('Failed to get IP address: $e');
    }
  }

  static Future<String> _getWifiIPAddress() async {
    final networkInfo = NetworkInfo();
    final wifiIP = await networkInfo.getWifiIP();
    return wifiIP ?? 'Unknown';
  }

  static Future<String> _getLocalIPAddress() async {
    try {
      final interfaces = await NetworkInterface.list(
        includeLoopback: false,
        includeLinkLocal: true,
      );

      // Find the first IPv4 address that is not loopback and not link local
      final interface = interfaces.firstWhere(
            (interface) => interface.addresses.any(
                (address) => address.type == InternetAddressType.IPv4 &&
                !address.isLoopback && !address.isLinkLocal
        ),
        orElse: () => throw Exception('No suitable network interface found'),
      );

      final address = interface.addresses.firstWhere(
            (address) => address.type == InternetAddressType.IPv4,
        orElse: () => InternetAddress('0.0.0.0'), // Return an empty address
      );

      return address.address;
    } catch (e) {
      throw Exception('Failed to get local IP address: $e');
    }
  }
}
