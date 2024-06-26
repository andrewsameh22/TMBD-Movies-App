import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_app/core/failures/failure.dart';
import 'package:tmdb_movies_app/movies/data/datasource/base_movies_remote_data_source.dart';
import 'package:tmdb_movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/failures/exceptions.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../models/movie_model/movie_model.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository({required this.baseMoviesRemoteDataSource});

  @override
  Future<Either<Failure, MoviesDataModel>> getPopularMovies(
      {required PopularMoviesParameters parameters}) async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies(
        parameters: parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      {required MovieDetailsParameters parameters}) async {
    final result = await baseMoviesRemoteDataSource.getMovieDetails(
        parameters: parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
