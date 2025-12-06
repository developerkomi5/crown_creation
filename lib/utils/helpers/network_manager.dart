import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crowncreation/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  // initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  // update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  void _updateConnectionStatus(List<ConnectivityResult> results) {
    final status = results.isNotEmpty ? results.first : ConnectivityResult.none;
    _connectionStatus.value = status;
    if (_connectionStatus.value == ConnectivityResult.none) {
      KLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  // check the internet connection status.
  // return 'true' if connected, 'false' otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  // Dispose or close the active connectivity stream.
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
