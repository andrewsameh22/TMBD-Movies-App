import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb_movies_app/core/base_usecase/base_usecase.dart';

import '../../../data/models/movie_model/movie_model.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  MoviesCubit({
    required this.getPopularMoviesUseCase,
  }) : super(MoviesInitial());

  static MoviesCubit get(context) => BlocProvider.of(context);

  void refreshCubit() {
    emit(MoviesRefresh());
  }

  int selectedPage = 1;
  int totalPages = 1;

  final ScrollController scrollController = ScrollController();

  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 600), // Adjust duration as needed
      curve: Curves.easeIn, // Adjust curve as needed
    );
  }

  List<Movie>? popularMoviesList;

  Future<void> fetchPopularMovies({required int page}) async {
    emit(GetPopularMoviesLoadingState());
    final result = await getPopularMoviesUseCase(
        PopularMoviesParameters(pageNumber: page));
    result.fold(
      (failure) => emit(GetPopularMoviesFailureState(message: failure.message)),
      (data) {
        popularMoviesList = data.movies;
        selectedPage = data.currentPage;
        totalPages = data.totalPages;
        emit(GetPopularMoviesSuccessState());
      },
    );
  }
}
