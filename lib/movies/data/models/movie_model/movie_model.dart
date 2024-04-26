import '../../../domain/entities/movie_entity.dart';

class MoviesDataModel extends MoviesDataEntity {
  MoviesDataModel({
    required super.movies,
    required super.currentPage,
    required super.totalPages,
  });

  factory MoviesDataModel.fromJson(Map<String, dynamic> json) =>
      MoviesDataModel(
        movies: List<MovieModel>.from(
            json['results'].map((x) => MovieModel.fromJson(x)) ?? []),
        currentPage: json["page"],
        totalPages: json["total_pages"],
      );
}

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.releaseDate,
    required super.backdropPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        releaseDate: json["release_date"],
        backdropPath: json["backdrop_path"] ?? '',
      );
}
