import '../../domain/entities/movie_entity.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<Movie>> getPopularMovies();
}
