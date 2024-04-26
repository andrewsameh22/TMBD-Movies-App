import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';

import '../../../core/failures/failure.dart';
import '../../data/models/movie_model/movie_model.dart';
import '../entities/movie_details_entity.dart';
import '../usecases/get_movie_details_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, MoviesDataModel>> getPopularMovies(
      {required PopularMoviesParameters parameters});

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      {required MovieDetailsParameters parameters});
}
