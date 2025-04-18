// providers/internet_provider.dart
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetProvider with ChangeNotifier {
  bool _hasInternet = true;
  final checker = InternetConnection();

  bool get hasInternet => _hasInternet;

  void startMonitoring() {
    checker.onStatusChange.listen((status) {
      _hasInternet = status == InternetStatus.connected;
      notifyListeners();
    });
  }

  void checkConnection() async {
    _hasInternet = await checker.hasInternetAccess;
    notifyListeners();
  }
}
