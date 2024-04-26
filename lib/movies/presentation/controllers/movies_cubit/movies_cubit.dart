import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb_movies_app/core/base_usecase/base_usecase.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  MoviesCubit({
    required this.getPopularMoviesUseCase,
  }) : super(MoviesInitial());

  static MoviesCubit get(context) => BlocProvider.of(context);

  List<Movie>? popularMoviesList;

  Future<void> fetchPopularMovies() async {
    emit(GetPopularMoviesLoadingState());
    final result = await getPopularMoviesUseCase(const NoParameters());
    print(result);
    result.fold(
      (failure) => emit(GetPopularMoviesFailureState(message: failure.message)),
      (data) {
        popularMoviesList = data;
        emit(GetPopularMoviesSuccessState());
      },
    );
  }
}
