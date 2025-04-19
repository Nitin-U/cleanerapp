import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetProvider with ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  bool _hasInternet = true;
  bool get hasInternet => _hasInternet;

  InternetProvider() {
    _initialize();
  }

  void _initialize() {
    checkInitialConnection();
    _subscription = _connectivity.onConnectivityChanged.listen((resultList) {
      // Take the first result in the list for simplicity
      final result = resultList.isNotEmpty ? resultList.first : ConnectivityResult.none;
      _updateStatus(result);
    });
  }

  Future<void> checkInitialConnection() async {
    List<ConnectivityResult> results = await _connectivity.checkConnectivity();
    final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
    _updateStatus(result);
  }

  void _updateStatus(ConnectivityResult result) {
    bool previousStatus = _hasInternet;
    _hasInternet = result != ConnectivityResult.none;

    if (_hasInternet != previousStatus) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
