import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import '../networking/NetworkConnectivity.dart';

class Goals extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GoalsState();
  }
}

class _GoalsState extends State<Goals>
    with AutomaticKeepAliveClientMixin<Goals> {
  final _connectivity = Connectivity();
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();


    _connectivity.checkConnectivity().then((result) {
      if (mounted) {
        setState(() {
          _parseConnectivityResult(result);
        });
      }
    });

    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (mounted) {
        setState(() {
          _parseConnectivityResult(result);
        });
      }
    });
  }

  /// This function sets the current network state
  /// * parameters
  /// result:- Instance of ConnectivityResult that holds the network state if
  /// it is Wifi or Mobile or None
  void _parseConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        _isConnected = true;
        break;
      case ConnectivityResult.wifi:
        _isConnected = true;
        break;
      case ConnectivityResult.none:
        _isConnected = false;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NetworkConnectivity(
      isConnected: _isConnected,
      child: Center(
        child: Label(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Label extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          NetworkConnectivity.of(context).isConnected ? "Connected" : "Not Connected",
          style: Theme.of(context).textTheme.display1,
        ),
    );
  }
}
