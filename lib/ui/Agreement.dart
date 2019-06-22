import 'package:flutter/material.dart';
import '../helpers/LocalizationHelper.dart';
import './HomePage.dart';

class Agreement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AgreementState();
  }
}

class _AgreementState extends State<Agreement> {

  var _width = 150.0;
  var _height = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/images/ic_logo_large.png',
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Text(
                        "kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh s"
                        "dgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg "
                        "sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh "
                        "kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf d"
                        "sh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh "
                        "dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js d"
                        "fsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg d"
                        "gf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdg"
                        "h dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js df"
                        "sh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh"
                        " sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh"
                        " jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg d"
                        "gf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sd"
                        "ghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo "
                        "sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh df"
                        "g sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihd"
                        "o sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg"
                        " sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo "
                        "sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdgha"
                        "fdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh"
                        " sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh"
                        " kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh d"
                        "fg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf "
                        "dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js df"
                        "sh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh"
                        " dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf d"
                        "sh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh "
                        "kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg "
                        "sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh s"
                        "dgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;"
                        "sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodg"
                        "ihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg "
                        "sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg "
                        "sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh"
                        " kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sd"
                        "ghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihd"
                        "o sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg "
                        "sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js d"
                        "fsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh "
                        "sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghaf"
                        "dh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg"
                        " dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sd"
                        "ghafdh jsgf js dfsh kfd;sodgihdo sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh kfd;sodgihdo"
                        " sdg dgf dsh sdgh sdghsdfg sdgh dfg sdghafdh jsgf js dfsh "),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: GestureDetector(
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
                  onHorizontalDragCancel: _onDragEnd,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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

  _onDragEnd() {
    setState(() {
      _height = 50.0;
      _width = 150.0;
    });
  }

  /// getter that builds the PageRoute for Home Widget
  PageRouteBuilder get _homeRoute {
    return PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return HomePage();
        },
        transitionsBuilder:
            (___, Animation<double> animation, ____, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: RotationTransition(
              turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: child,
            ),
          );
        });
  }

  /*
   This function routes to the Personal Questionnaire
   */
  void _onTapQuestionnaire(BuildContext context) {
    Navigator.of(context).pushNamed("ui/Home");
    //Navigator.push(context, _homeRoute);
  }
}
