import 'package:flutter/widgets.dart';

class NetworkConnectivity extends InheritedWidget {
  NetworkConnectivity({@required this.isConnected, Key key, @required this.child}) : super(key: key, child: child);

  final Widget child;
  final bool isConnected;

  static NetworkConnectivity of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(NetworkConnectivity)as NetworkConnectivity);
  }

  @override
  bool updateShouldNotify( NetworkConnectivity oldWidget) {
    return oldWidget.isConnected !=isConnected;
  }
}