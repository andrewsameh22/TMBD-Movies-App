import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_app/core/base_usecase/base_usecase.dart';
import 'package:tmdb_movies_app/core/failures/failure.dart';
import 'package:tmdb_movies_app/movies/domain/repository/base_movies_repository.dart';

import '../entities/movie_entity.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
