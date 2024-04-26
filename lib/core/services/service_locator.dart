import 'package:get_it/get_it.dart';
import 'package:tmdb_movies_app/movies/data/repository/movies_repository.dart';
import 'package:tmdb_movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:tmdb_movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:tmdb_movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:tmdb_movies_app/movies/presentation/controllers/movie_details_cubit/movie_details_cubit.dart';
import 'package:tmdb_movies_app/movies/presentation/controllers/movies_cubit/movies_cubit.dart';

import '../../movies/data/datasource/base_movies_remote_data_source.dart';
import '../../movies/data/datasource/movies_remote_data_source.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///Data Sources
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());

    ///Repositories
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(baseMoviesRemoteDataSource: sl()));

    ///UseCases
    sl.registerLazySingleton(
        () => GetPopularMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetMovieDetailsUseCase(baseMoviesRepository: sl()));

    ///Cubit
    sl.registerFactory(() => MoviesCubit(
          getPopularMoviesUseCase: sl(),
        ));
    sl.registerFactory(() => MovieDetailsCubit(
          getMovieDetailsUseCase: sl(),
        ));
  }
}
