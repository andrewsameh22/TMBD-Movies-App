import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:tmdb_movies_app/movies/data/datasource/movies_local_data_source.dart';

import '../../../../core/hive_helper/hive_helper.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final MoviesLocalDataSource moviesLocalDataSource;

  MoviesCubit({
    required this.moviesLocalDataSource,
    required this.getPopularMoviesUseCase,
  }) : super(MoviesInitial());

  static MoviesCubit get(context) => BlocProvider.of(context);

  void refreshCubit() {
    emit(MoviesRefresh());
  }

  int selectedPage = 1;
  int totalPages = 2;

  final ScrollController scrollController = ScrollController();

  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 600), // Adjust duration as needed
      curve: Curves.easeIn, // Adjust curve as needed
    );
  }

  List<Movie>? popularMoviesList;

  Future<void> fetchPopularMovies({required int page}) async {
    emit(GetPopularMoviesLoadingState());

    try {
      if (page == 1) {
        await moviesLocalDataSource.fetchLocalMovies();
        if (locallySavedMovies?.length != 0) {
          popularMoviesList = locallySavedMovies;
          emit(GetLocalPopularMoviesSuccessState());
        }
      }
      final result = await getPopularMoviesUseCase(
          PopularMoviesParameters(pageNumber: page));
      result.fold(
            (failure) =>
            emit(GetPopularMoviesFailureState(message: failure.message)),
            (data) {
          popularMoviesList = data.movies;
          selectedPage = data.currentPage;
          totalPages = data.totalPages;
          saveMovies(
            movies: data.movies,
          );
          emit(GetPopularMoviesSuccessState());
        },
      );
    } catch (e) {
      emit(GetPopularMoviesFailureState(message: e.toString()));
    }
  }
}
