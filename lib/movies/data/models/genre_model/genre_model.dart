import '../../../domain/entities/genre_entity.dart';

class GenreModel extends Genre {
  GenreModel({
    required super.name,
    required super.id,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        name: json["name"],
        id: json["id"],
      );
}
