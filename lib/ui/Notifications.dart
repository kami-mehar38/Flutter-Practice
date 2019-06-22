import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationState();
  }
}

class _NotificationState extends State<Notifications> with AutomaticKeepAliveClientMixin<Notifications> {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              child: CellItem(),
              onTap: () => _onTap(index),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  /// This function handles the item tapped in the list
  /// -parameter
  ///   index: current index of the item in the list
  _onTap(int index) {
    print(index);
  }
}

class CellItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CellItem();
  }
}

class _CellItem extends State<CellItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      child: Text("kamran"),
    );
  }
}
