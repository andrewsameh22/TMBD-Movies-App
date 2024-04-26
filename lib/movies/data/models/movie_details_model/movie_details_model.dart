import '../../../domain/entities/movie_details_entity.dart';
import '../genre_model/genre_model.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required super.id,
    required super.title,
    required super.releaseDate,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
      );
}
