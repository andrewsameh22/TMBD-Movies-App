import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  MovieDetailsCubit({
    required this.getMovieDetailsUseCase,
  }) : super(MovieDetailsInitial());

  static MovieDetailsCubit get(context) => BlocProvider.of(context);

  Movie? detailedMovie;

  Future<void> fetchMovieDetails({required movieId}) async {
    emit(GetMovieDetailsLoadingState());
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: movieId));
    result.fold(
      (failure) => emit(GetMovieDetailsFailureState(message: failure.message)),
      (data) {
        print(data);
        detailedMovie = data;
        emit(GetMovieDetailsSuccessState());
      },
    );
  }
}
