import 'package:equatable/equatable.dart';

class MoviesDataEntity extends Equatable {
  final List<Movie> movies;
  final int currentPage;
  final int totalPages;

  const MoviesDataEntity({
    required this.movies,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  List<Object> get props => [
        movies,
        currentPage,
        totalPages,
      ];
}

class Movie extends Equatable {
  final int id;
  final String title;
  final String releaseDate;
  final String backdropPath;

  const Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.backdropPath,
  });

  @override
  List<Object> get props => [
        id,
        title,
        releaseDate,
        backdropPath,
      ];
}
