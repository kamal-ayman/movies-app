import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movies/movies/domain/usecases/get_movie_recommendations_usecase.dart';

import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(
      this.getMovieDetailUseCase, this.getMovieRecommendationsUseCase)
      : super(const MovieDetailState()) {
    on<GetMovieDetailEvent>(_getMovieDetail);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendations);
  }

  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetMovieRecommendationsUseCase getMovieRecommendationsUseCase;

  FutureOr<void> _getMovieDetail(
      GetMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    final result =
        await getMovieDetailUseCase(MovieDetailUseCaseParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailRequestState: RequestState.error,
              movieDetailMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetail: r,
              movieDetailRequestState: RequestState.success,
            )));
  }

  Future<FutureOr<void>> _getMovieRecommendations(
      GetMovieRecommendationsEvent event,
      Emitter<MovieDetailState> emit) async {
    final result = await getMovieRecommendationsUseCase(
        MovieRecommendationParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieRecommendationsRequestState: RequestState.error,
              movieRecommendationsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieRecommendations: r,
              movieRecommendationsRequestState: RequestState.success,
            )));
  }
}
class MoviesDetailQueue {

  static List<int> moviesId = [];


  pushMovieId(int id){
    moviesId.add(id);
    print(moviesId);
  }
  int? popMovieId(int id){
    moviesId.remove(id);

    if (moviesId.isNotEmpty) {
      print(moviesId);
      return moviesId.last;
    }
    print(null);
    return null;
  }
}
