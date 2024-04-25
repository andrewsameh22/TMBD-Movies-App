import '../entities/movie_entity.dart';

abstract class BaseMoviesRepository {
  Future<List<Movie>> getPopularMovies();
}
