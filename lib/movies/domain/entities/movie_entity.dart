import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String releaseDate;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final List<int> genreIds;

  const Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
  });

  @override
  List<Object> get props => [
    id,
    title,
    releaseDate,
    backdropPath,
    overview,
    voteAverage,
    genreIds,
  ];
}
