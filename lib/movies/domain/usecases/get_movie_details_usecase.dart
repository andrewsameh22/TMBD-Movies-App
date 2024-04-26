import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_movies_app/core/base_usecase/base_usecase.dart';
import 'package:tmdb_movies_app/core/failures/failure.dart';
import 'package:tmdb_movies_app/movies/domain/repository/base_movies_repository.dart';

import '../entities/movie_details_entity.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters: parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({
    required this.movieId,
  });

  @override
  List<Object> get props => [
        movieId,
      ];
}
