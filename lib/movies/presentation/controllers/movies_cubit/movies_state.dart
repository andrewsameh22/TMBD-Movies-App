part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesRefresh extends MoviesState {}

class GetPopularMoviesLoadingState extends MoviesState {}

class GetPopularMoviesSuccessState extends MoviesState {}

class GetLocalPopularMoviesSuccessState extends MoviesState {}

class GetPopularMoviesFailureState extends MoviesState {
  final String message;

  GetPopularMoviesFailureState({required this.message});
}
