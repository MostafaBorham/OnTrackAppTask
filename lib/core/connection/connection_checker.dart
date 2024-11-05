import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../utils/di.dart';

class ConnectionChecker {
  static Future<bool> get isConnected =>
      DependencyInjector.instance<InternetConnectionChecker>().hasConnection;

  static Stream<InternetConnectionStatus> listenToConnection(){
    return DependencyInjector.instance<InternetConnectionChecker>().onStatusChange;
  }
}