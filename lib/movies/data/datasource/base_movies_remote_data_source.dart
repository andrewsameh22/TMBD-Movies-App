import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../models/movie_model/movie_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<MoviesDataModel> getPopularMovies(
      {required PopularMoviesParameters parameters});

  Future<MovieDetails> getMovieDetails(
      {required MovieDetailsParameters parameters});
}
