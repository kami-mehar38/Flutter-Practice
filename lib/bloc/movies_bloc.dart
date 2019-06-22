import '../repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/Movie.dart';

class MoviesBloc {
  final _moviesFetcher = PublishSubject<Movie>();

  Observable<Movie> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    Movie itemModel = await MovieRepository.currentInstance.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }
  dispose() {
    _moviesFetcher.close();
  }
}
