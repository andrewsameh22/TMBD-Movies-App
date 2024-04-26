import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_app/core/failures/failure.dart';
import 'package:tmdb_movies_app/movies/data/datasource/base_movies_remote_data_source.dart';
import 'package:tmdb_movies_app/movies/domain/entities/movie_entity.dart';
import 'package:tmdb_movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/failures/exceptions.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository({required this.baseMoviesRemoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
