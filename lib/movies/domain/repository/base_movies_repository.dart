import 'package:dartz/dartz.dart';

import '../../../core/failures/failure.dart';
import '../entities/movie_entity.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovies();
}
