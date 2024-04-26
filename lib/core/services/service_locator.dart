import 'package:get_it/get_it.dart';
import 'package:tmdb_movies_app/movies/data/datasource/base_movies_remote_data_source.dart';
import 'package:tmdb_movies_app/movies/data/repository/movies_repository.dart';
import 'package:tmdb_movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:tmdb_movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';

import '../../movies/data/datasource/movies_remote_data_source.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///Data Sources
    sl.registerLazySingleton(() => MoviesRemoteDataSource);

    ///Repositories
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(baseMoviesRemoteDataSource: sl()));

    ///UseCases
    sl.registerLazySingleton(
        () => GetPopularMoviesUseCase(baseMoviesRepository: sl()));
  }
}
