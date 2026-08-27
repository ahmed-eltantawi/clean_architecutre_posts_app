import 'package:internet_connection_checker/internet_connection_checker.dart';

/// abstract class to get information about the network
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// implementation of NetworkInfo
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  new({required this.internetConnectionChecker});

  @override
  /// check if the device is connected to the internet
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
