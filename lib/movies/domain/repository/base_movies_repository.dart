import 'package:dartz/dartz.dart';

import '../../../core/failures/failure.dart';
import '../entities/movie_entity.dart';
import '../usecases/get_movie_details_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, Movie>> getMovieDetails(
      {required MovieDetailsParameters parameters});
}
