import 'package:movies/movies/domain/entities/movie_detail.dart';

import 'genre_model.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.id,
    required super.overview,
    required super.runtime,
    required super.backdropPath,
    required super.genres,
    required super.voteAverage,
    required super.title,
    required super.releaseDate,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        id: json['id'],
        overview: json['overview'],
        runtime: json['runtime'],
        backdropPath: json['backdrop_path']??'/dlrWhn0G3AtxYUx2D9P2bmzcsvF.jpg',
        genres: List<GenreModel>.from(json['genres'].map((e) => GenreModel.fromJson(e))),
        voteAverage: json['vote_average'].toDouble(),
        title: json['title'],
        releaseDate: json['release_date'],
      );
}
