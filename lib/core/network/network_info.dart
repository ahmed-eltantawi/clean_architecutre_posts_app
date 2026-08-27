import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

/// abstract class to get information about the network
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// implementation of NetworkInfo
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl({required this.connectivity});

  @override
  /// check if the device is connected to the internet
  Future<bool> get isConnected async {
    final connectivityResults = await connectivity.checkConnectivity();

    if (connectivityResults.contains(ConnectivityResult.none)) {
      return false;
    }

    // Avoid a single HTTP probe that can fail even when the device is online.
    const hosts = ['dummyjson.com', 'cloudflare.com', 'google.com'];

    for (final host in hosts) {
      try {
        final result = await InternetAddress.lookup(host);
        if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
          return true;
        }
      } on SocketException {
        // Try the next host before reporting the device as offline.
      }
    }

    return false;
  }
}
