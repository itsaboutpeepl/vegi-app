import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:network_info_plus/network_info_plus.dart'; // wont be pacakges into APK if (kDebugMode) false as no code will call the package

/// Method to get local device IPs on same network as flutter device
///
/// See https://stackoverflow.com/a/68209358
Future<List<String>> scanNetwork() async {
  final ipAddressesOnWifiNetwork = <String>[];
  if (kDebugMode) {
    if (Platform.isAndroid || Platform.isIOS) {
      await (NetworkInfo().getWifiIP()).then(
        (ip) async {
          final String subnet = ip!.substring(0, ip.lastIndexOf('.'));
          const port = 22;
          for (var i = 0; i < 256; i++) {
            final ip = '$subnet.$i';
            await Socket.connect(
              ip,
              port,
              timeout: const Duration(
                milliseconds: 50,
              ),
            ).then((socket) async {
              await InternetAddress(socket.address.address)
                  .reverse()
                  .then((value) {
                print(value.host);
                print(socket.address.address);
                ipAddressesOnWifiNetwork.add(value.host);
              }).catchError((dynamic error) {
                if (error is SocketException) {
                  final socketException = error as SocketException;
                  if (socketException.message != 'Failed reverse host lookup') {
                    print(socket.address.address);
                    print('Unknown SocketException: $error');
                  }
                } else {
                  print('Unknown Error: $error');
                }
              });
              socket.destroy();
            }).catchError((error) => null);
          }
        },
      );
      print('Done');
    } else {
      throw Exception(
          'Network info not implemented for non-mobile platforms, see https://stackoverflow.com/a/68209358');
    }
  }
  return ipAddressesOnWifiNetwork;
}
