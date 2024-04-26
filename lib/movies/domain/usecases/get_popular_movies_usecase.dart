import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_app/core/failures/failure.dart';
import 'package:tmdb_movies_app/movies/domain/repository/base_movies_repository.dart';

import '../entities/movie_entity.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase({required this.baseMoviesRepository});

  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
