import 'package:movies/movies/domain/entities/genre.dart';

class GenreModel extends Genre {
  const GenreModel({
    required super.id,
    required super.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json['id'],
        name: json['name'],
      );
}
