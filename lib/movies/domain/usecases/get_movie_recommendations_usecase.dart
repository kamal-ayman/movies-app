import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/movie_recommendation.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class GetMovieRecommendationsUseCase extends BaseUseCase<
    List<MovieRecommendation>, MovieRecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieRecommendation>>> call(
      MovieRecommendationParameters parameters) async {
    return await baseMoviesRepository.getMovieRecommendation(parameters);
  }
}

class MovieRecommendationParameters extends Equatable {
  final int id;

  const MovieRecommendationParameters({required this.id});

  @override
  List<Object?> get props => [
        id,
      ];
}
