import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie_detail.dart';
import '../../../domain/entities/movie_recommendation.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailRequestState;
  final String movieDetailMessage;

  final List<MovieRecommendation> movieRecommendations;
  final RequestState movieRecommendationsRequestState;
  final String movieRecommendationsMessage;

  const MovieDetailState({
    this.movieDetail,
    this.movieDetailRequestState = RequestState.loading,
    this.movieDetailMessage = '',

    this.movieRecommendations = const [],
    this.movieRecommendationsRequestState = RequestState.loading,
    this.movieRecommendationsMessage = '',
  });

  MovieDetailState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailRequestState,
    String? movieDetailMessage,

    List<MovieRecommendation>? movieRecommendations,
    RequestState? movieRecommendationsRequestState,
    String? movieRecommendationsMessage,

  }) =>
      MovieDetailState(
        movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailRequestState: movieDetailRequestState ?? this.movieDetailRequestState,

        movieRecommendationsMessage: movieRecommendationsMessage ?? this.movieRecommendationsMessage,
        movieRecommendations: movieRecommendations ?? this.movieRecommendations,
        movieRecommendationsRequestState: movieRecommendationsRequestState ?? this.movieRecommendationsRequestState,
      );

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailRequestState,
        movieDetailMessage,

        movieRecommendations,
        movieRecommendationsRequestState,
        movieRecommendationsMessage,
      ];
}
