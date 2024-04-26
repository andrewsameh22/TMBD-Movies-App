import '../../domain/entities/movie_entity.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<Movie>> getPopularMovies();

  Future<Movie> getMovieDetails({required MovieDetailsParameters parameters});
}
