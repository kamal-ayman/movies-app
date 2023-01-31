import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/movies/data/models/movie_detail_model.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/domain/usecases/get_movie_detail_usecase.dart';

import '../../../core/network/error_message_model.dart';
import '../../domain/usecases/get_movie_recommendations_usecase.dart';
import '../models/movie_recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailModel> getMovieDetail(
      MovieDetailUseCaseParameters parameters);

  Future<List<MovieRecommendationModel>> getMovieRecommendation(
      MovieRecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      ApiConstance.nowPlayingMoviesPath,
      queryParameters: {
        'api_key': ApiConstance.apiKey,
      },
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(
      ApiConstance.nowPopularMoviesPath,
      queryParameters: {
        'api_key': ApiConstance.apiKey,
      },
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(
      ApiConstance.nowTopRatedMoviesPath,
      queryParameters: {
        'api_key': ApiConstance.apiKey,
      },
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(
      MovieDetailUseCaseParameters parameters) async {
    final response = await Dio().get(
      ApiConstance.movieDetailPath(parameters.id),
      queryParameters: {
        'api_key': ApiConstance.apiKey,
      },
    );

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieRecommendationModel>> getMovieRecommendation(
      MovieRecommendationParameters parameters) async {
    final response = await Dio().get(
      ApiConstance.movieRecommendationsPath(parameters.id),
      queryParameters: {
        'api_key': ApiConstance.apiKey,
      },
    );

    if (response.statusCode == 200) {
      return List<MovieRecommendationModel>.from(
        (response.data['results'] as List).map((e) => MovieRecommendationModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
