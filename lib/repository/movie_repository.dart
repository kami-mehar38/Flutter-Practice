import 'dart:async';
import '../networking/MovieApiProvider.dart';
import '../models/Movie.dart';

class MovieRepository {

  MovieRepository._internal();
  static final MovieRepository currentInstance = MovieRepository._internal();

  MovieApiProvider _moviesApiProvider = MovieApiProvider();

  Future<Movie> fetchAllMovies() => _moviesApiProvider.fetchMovieList();
}
