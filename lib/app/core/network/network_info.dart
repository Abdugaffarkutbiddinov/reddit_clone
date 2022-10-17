import 'dart:async';

// import 'package:airplane_mode_checker/airplane_mode_checker.dart';
import 'package:connectivity/connectivity.dart';
import 'package:logger/logger.dart';


const CLASS_TAG = '[NETWORK CONNECTIVITY]';

abstract class NetworkInfo {
  Future<Timer> init();

  Future<bool> checkNetworkConnectivity();

  Future<bool> isApiConnected();

  Future<ConnectivityResult> get connectivityResult;

  Future<bool> get apiConnectivityResult;

  Stream<ConnectivityResult> get onNetworkConnectivityChanged;

  Stream<bool> get onBackendConnectivityChanged;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  final StreamController<bool> backendConnectivity =
  StreamController<bool>.broadcast();

  bool _isBackendConnected = false;

  @override
  Future<Timer> init() async {
    Logger().d('$CLASS_TAG Network connectivity Init');

    backendConnectivity.add(_isBackendConnected);

    return Timer.periodic(const Duration(seconds: 5), (timer) async => isApiConnected());
  }

  @override
  Future<bool> checkNetworkConnectivity() async {
    final result = await connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> isApiConnected() async {
    final isNetworkConnected = await checkNetworkConnectivity();
    bool isBaseApiConnected = false;

    if (!isNetworkConnected) {
      isBaseApiConnected = false;
    } else {
      isBaseApiConnected = true;
    }

    if (isBaseApiConnected != _isBackendConnected) {
      _isBackendConnected = isBaseApiConnected;
    }

    final isApiEnabled = _isBackendConnected;

    backendConnectivity.add(isApiEnabled);

    return isApiEnabled;
  }

  @override
  Future<ConnectivityResult> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  @override
  Future<bool> get apiConnectivityResult async => isApiConnected();

  @override
  Stream<ConnectivityResult> get onNetworkConnectivityChanged =>
      connectivity.onConnectivityChanged;

  @override
  Stream<bool> get onBackendConnectivityChanged => backendConnectivity.stream;
}
