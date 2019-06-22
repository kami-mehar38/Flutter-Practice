import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helpers/LocalizationHelper.dart';
import '../helpers/BouncingButton.dart';
import './HomePage.dart';
import 'dart:math';

class Login extends StatefulWidget {
  void Function() onTapSignUp;
  setOnTapSignUp({void Function() onTapSignUp}) {
    this.onTapSignUp = onTapSignUp;
  }

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login>
    with AutomaticKeepAliveClientMixin<Login>, WidgetsBindingObserver {
  double _heightFactor = 0.0;
  double _overlap = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/ic_journey.jpg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.23,
          right: 32,
          child: Text(
            MyLocalizations.of(context).loginCapital ?? "",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontFamily: 'BalooBhai'),
          ),
        ),
        Positioned(
          top: (MediaQuery.of(context).size.height * 0.3) - _overlap,
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500],
                  offset: Offset(0, -2),
                  spreadRadius: 0.6,
                  blurRadius: 12,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 32,
                ),
                MyTextField(),
                SizedBox(
                  height: 32,
                ),
                MyTextField(),
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Positioned(
                        bottom: (MediaQuery.of(context).size.height * 0.3),
                        child: Column(
                          children: <Widget>[
                            BouncingButton(
                                text: MyLocalizations.of(context).login,
                                width: (MediaQuery.of(context).size.width) - 90,
                                height: 55,
                                onTap: (context) {
                                  print('OK');
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        maintainState: true,
                                        builder: (context) {
                                          return HomePage();
                                        }),
                                  );
                                }),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: _onTapSignUp,
                              child: Text('OR SIGN UP'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeMetrics() {
    final renderObject = context.findRenderObject();
    final renderBox = renderObject as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final widgetRect = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      renderBox.size.width,
      renderBox.size.height,
    );
    final keyboardTopPixels =
        window.physicalSize.height - window.viewInsets.bottom;
    final keyboardTopPoints = keyboardTopPixels / window.devicePixelRatio;
    final overlap = widgetRect.bottom - keyboardTopPoints;
    if (overlap >= 0) {
      print('Overlap is $overlap');
      setState(() {
        _overlap = overlap;
      });
    } else if (overlap < 0) {
      setState(() {
        _overlap = 0;
      });
    }
  }

  _onTapSignUp() {
    widget.onTapSignUp();
  }

  _dragUpdateDetails(DragUpdateDetails dragUpdateDetails) {
    if (dragUpdateDetails.delta.dy > dragUpdateDetails.delta.dx) {}
    print(dragUpdateDetails.delta.dy);

    final scale = _heightFactor +=
        (dragUpdateDetails.delta.dy / MediaQuery.of(context).devicePixelRatio);
    if (((MediaQuery.of(context).size.height * 0.3) + scale) <=
        MediaQuery.of(context).size.height) {
      if (mounted) {
        setState(() {
          _heightFactor += (dragUpdateDetails.delta.dy /
              MediaQuery.of(context).devicePixelRatio);
        });
      }
    }
  }
}

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
                decoration: InputDecoration(
                  hintText: MyLocalizations.of(context).email,
                  hintStyle: TextStyle(color: Colors.black12, fontSize: 16),
                  hintMaxLines: 1,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Color(0xFFEfABA8),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Color(0xFFEfABA8),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Color(0xFFEfABA8),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(22, 18, 22, 18),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFFEfABA8),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                textCapitalization: TextCapitalization.sentences,
                scrollPadding: EdgeInsets.zero,
              );
  }
}
