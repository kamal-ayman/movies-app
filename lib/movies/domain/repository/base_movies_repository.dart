import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movie_detail.dart';
import 'package:movies/movies/domain/entities/movie_recommendation.dart';
import 'package:movies/movies/domain/usecases/get_movie_detail_usecase.dart';

import '../../../core/error/failure.dart';

import '../entities/movie.dart';
import '../usecases/get_movie_recommendations_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetail(
      MovieDetailUseCaseParameters parameters);

  Future<Either<Failure, List<MovieRecommendation>>> getMovieRecommendation(
      MovieRecommendationParameters parameters);
}
