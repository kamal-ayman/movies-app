import 'package:equatable/equatable.dart';

import 'genre.dart';

class MovieDetail extends Equatable {
  final int id;
  final String backdropPath;
  final List<Genre> genres;
  final double voteAverage;
  final String title;
  final String overview;
  final String releaseDate;
  final int runtime;

  const MovieDetail({
    required this.id,
    required this.overview,
    required this.runtime,
    required this.backdropPath,
    required this.genres,
    required this.voteAverage,
    required this.title,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        overview,
        runtime,
        backdropPath,
        genres,
        voteAverage,
        title,
        releaseDate,
      ];
}
