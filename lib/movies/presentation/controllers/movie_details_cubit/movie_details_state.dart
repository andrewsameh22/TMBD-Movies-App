part of 'movie_details_cubit.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class GetMovieDetailsLoadingState extends MovieDetailsState {}

class GetMovieDetailsSuccessState extends MovieDetailsState {}

class GetMovieDetailsFailureState extends MovieDetailsState {
  final String message;

  GetMovieDetailsFailureState({required this.message});
}
