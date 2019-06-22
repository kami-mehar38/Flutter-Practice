import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/scheduler.dart';
import '../helpers/Helpers.dart';
import '../helpers/LocalizationHelper.dart';

class MovieDetails extends StatefulWidget {
  final _url;

  MovieDetails(this._url);

  @override
  State<StatefulWidget> createState() {
    return _MovieDetailsState();
  }
}

class _MovieDetailsState extends State<MovieDetails>
    with AutomaticKeepAliveClientMixin<MovieDetails> {
  var _width = 150.0;
  var _height = 50.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// checking if the last frame has been drawn on the screen
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {}
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 330,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  GestureDetector(
                    child: Hero(
                      tag: widget._url,
                      child: ClipShadowPath(
                        shadow: Shadow(
                          color: Colors.black38,
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                        clipper: TriangleClipper(),
                        child: Container(
                          child: CachedNetworkImage(
                            imageUrl: widget._url,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Icon(
                                  Icons.image,
                                  color: Colors.grey,
                                  size: 60,
                                ),
                            errorWidget: (context, url, error) => Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                  size: 60,
                                ),
                          ),
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Positioned(
                    top: 268.5,
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
                      onTapCancel: _onTapCancel,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  _handleDrawnState(BuildContext context) {
    print('ok layed out');
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

  _onTapCancel() {
    setState(() {
      _height = 50.0;
      _width = 150.0;
    });
  }
}
