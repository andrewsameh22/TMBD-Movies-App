import 'package:tmdb_movies_app/movies/domain/repository/base_movies_repository.dart';

import '../entities/movie_entity.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<List<Movie>> call() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
