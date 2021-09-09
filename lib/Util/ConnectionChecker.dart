import 'package:data_connection_checker_tv/data_connection_checker.dart';

class ConnectionChecker {
  static Future<bool> checkConnection() async {
    return await DataConnectionChecker().hasConnection;
  }
}
