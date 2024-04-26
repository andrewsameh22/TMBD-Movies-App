import '../../../domain/entities/movie_entity.dart';

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
