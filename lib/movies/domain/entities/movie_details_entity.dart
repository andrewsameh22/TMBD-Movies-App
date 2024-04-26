import 'package:equatable/equatable.dart';

import 'genre_entity.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String releaseDate;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final List<Genre> genres;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object> get props => [
        id,
        title,
        releaseDate,
        backdropPath,
        overview,
        voteAverage,
    genres,
      ];
}
