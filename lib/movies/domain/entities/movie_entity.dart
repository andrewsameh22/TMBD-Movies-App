import 'package:equatable/equatable.dart';

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
