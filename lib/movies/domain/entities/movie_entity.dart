import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'movie_entity.g.dart';

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

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String releaseDate;

  @HiveField(3)
  final String backdropPath;

  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.backdropPath,
  });

// @override
// List<Object> get props => [
//       id,
//       title,
//       releaseDate,
//       backdropPath,
//     ];
}
