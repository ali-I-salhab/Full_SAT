import 'package:internet_connection_checker/internet_connection_checker.dart';


class NetworkConnecionInfo {
   NetworkConnecionInfo();

  final InternetConnectionChecker connectionChecker = InternetConnectionChecker();

  @override
  Future<bool> get isConnected async => await connectionChecker.hasConnection;
}
