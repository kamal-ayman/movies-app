import 'package:movies/movies/domain/entities/movie_recommendation.dart';

class MovieRecommendationModel extends MovieRecommendation {
  const MovieRecommendationModel({
    super.backdropPath,
    required super.id,
  });

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationModel(
        backdropPath: json['backdrop_path'] ?? '/dlrWhn0G3AtxYUx2D9P2bmzcsvF.jpg',
        id: json['id'],
      );
}
