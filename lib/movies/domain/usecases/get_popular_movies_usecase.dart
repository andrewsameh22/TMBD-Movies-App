import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_movies_app/core/base_usecase/base_usecase.dart';
import 'package:tmdb_movies_app/core/failures/failure.dart';
import 'package:tmdb_movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../data/models/movie_model/movie_model.dart';

class GetPopularMoviesUseCase
    extends BaseUseCase<MoviesDataModel, PopularMoviesParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, MoviesDataModel>> call(
      PopularMoviesParameters parameters) async {
    return await baseMoviesRepository.getPopularMovies(parameters: parameters);
  }
}

class PopularMoviesParameters extends Equatable {
  final int pageNumber;

  const PopularMoviesParameters({
    required this.pageNumber,
  });

  @override
  List<Object> get props => [
        pageNumber,
      ];
}
