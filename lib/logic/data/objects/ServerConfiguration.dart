import 'package:vox_pad/logic/services/SharedPreferencesService.dart';

class ServerConfiguration {
  final String name;
  final String host;
  final int port;

  ServerConfiguration({
    this.name = "Default",
    required this.host,
    required this.port,
  });

  factory ServerConfiguration.fromJson(Map<String, dynamic> json) {
    return ServerConfiguration(
      name: json['name'],
      host: json['host'],
      port: json['port'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'host': host,
      'port': port,
    };
  }

  Future<void> saveConfiguration() async {
    await SharedPreferencesService.saveValue("Server Name", name);
    await SharedPreferencesService.saveValue("Server Host", host);
    await SharedPreferencesService.saveValue("Server Port", port);
  }

  static Future<ServerConfiguration?> getConfiguration() async {
    String? name = await SharedPreferencesService.getValue<String>("Server Name");
    String? host = await SharedPreferencesService.getValue<String>("Server Host");
    int? port = await SharedPreferencesService.getValue<int>("Server Port");

    if (host != null && port != null) {
      return ServerConfiguration(
        name: name ?? "Default",
        host: host,
        port: port,
      );
    }
    return null;
  }
}
