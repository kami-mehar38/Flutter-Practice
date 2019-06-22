import 'package:flutter/material.dart';
import '../helpers/LocalizationHelper.dart';

class Signup extends StatefulWidget {
  void Function() onTapLogIn;
  setOnTapLogIn({void Function() onTapLogIn}) {
    this.onTapLogIn = onTapLogIn;
  }
  @override
  State<StatefulWidget> createState() {
    return _SignupState();
  }
}

class _SignupState extends State<Signup> with AutomaticKeepAliveClientMixin<Signup> {

  var _width = 150.0;
  var _height = 50.0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          GestureDetector(
            child: AnimatedContainer(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xFFD72D27),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFEfABA8),
                      blurRadius: 6,
                      spreadRadius: 0.6,
                      offset: Offset(0, 2),
                    ),
                  ]),
              duration: Duration(milliseconds: 500),
              curve: Curves.elasticOut,
              width: _width,
              height: _height,
              child: Text(
                MyLocalizations.of(context).settings,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            onTapDown: (details) => _onTapDown(details),
            onTapUp: (details) => _onTapUp(details),
            onTapCancel: _onTapCancel,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  _onTapDown(TapDownDetails details) {
    print(details.globalPosition.dx);
    setState(() {
      _height = 45.0;
      _width = 140.0;
    });
  }

  _onTapUp(TapUpDetails details) {
    print(details.globalPosition.dx);
    setState(() {
      _height = 50.0;
      _width = 150.0;
    });
  }

  _onTapCancel() {
    setState(() {
      _height = 50.0;
      _width = 150.0;
    });
  }
}
