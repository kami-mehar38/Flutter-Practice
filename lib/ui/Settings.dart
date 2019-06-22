import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import '../bloc/movies_bloc.dart';
import '../models/Movie.dart';
import '../ui/MovieDetails.dart';
import 'dart:io';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings>
    with AutomaticKeepAliveClientMixin<Settings> {
  MoviesBloc _moviesBloc;

  @override
  void initState() {
    super.initState();

    _moviesBloc = MoviesBloc();
    _moviesBloc.fetchAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder(
          stream: _moviesBloc.allMovies,
          builder: (context, AsyncSnapshot<Movie> snapshot) {
            if (snapshot.hasData) {
              return _buildGridView(context, snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  _buildGridView(BuildContext context, AsyncSnapshot<Movie> snapshot) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.fromLTRB(24, Platform.isAndroid ? 24 : 16, 24, 8),
      itemCount: snapshot.data.results.length,
      addAutomaticKeepAlives: false,
      physics:
          Platform.isIOS ? BouncingScrollPhysics() : ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, crossAxisSpacing: 16, mainAxisSpacing: 32),
      itemBuilder: (BuildContext context, int index) {
        return AnimatedImageCell(snapshot?.data?.results[index]);
      },
    );
  }
}

/// Image cell for the image gallery
/// Constructor with Result object i.e POJO

class AnimatedImageCell extends StatefulWidget {
  final Results _result;

  AnimatedImageCell(this._result);

  @override
  _AnimatedImageCellState createState() => _AnimatedImageCellState();
}

class _AnimatedImageCellState extends State<AnimatedImageCell>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 1.0, end: 0.95).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
      reverseCurve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: GestureDetector(
        onTapDown: (details) => _onTapDown(details),
        onTapUp: (details) => _onTapUp(details),
        onTapCancel: _onTapCancel,
        onTap: () => _onTap(context,
            'https://image.tmdb.org/t/p/w185${widget._result.posterPath}'),
        child: Hero(
          tag: 'https://image.tmdb.org/t/p/w185${widget._result.posterPath}',
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 14,
                  spreadRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w185${widget._result.posterPath}',
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
            ),
          ),
        ),
      ),
    );
  }

  /// This function handles the on tap event of an Image in the gallery
  /// * parameters
  ///   -context: Instance of BuildContext
  ///   -url: String url path of image
  _onTap(BuildContext context, String url) {
    _controller.reverse();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return MovieDetails(url);
      }),
    );
  }

  _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  _onTapUp(TapUpDetails details) {
    _controller.forward();
  }

  _onTapCancel() {
    _controller.reverse();
  }
}
