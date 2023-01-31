import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies_usecase.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../core/utils/enums.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase  getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
          popularMoviesState: RequestState.error,
          popularMoviesMessage: l.message)),
      (r) => emit(state.copyWith(
          popularMovies: r, popularMoviesState: RequestState.success)),
    );
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
          nowPlayingMoviesState: RequestState.error,
          nowPlayingMoviesMessage: l.message)),
      (r) => emit(state.copyWith(
          nowPlayingMovies: r, nowPlayingMoviesState: RequestState.success)),
    );
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(
          topRatedMoviesState: RequestState.error,
          topRatedMoviesMessage: l.message)),
          (r) => emit(state.copyWith(
          topRatedMovies: r, topRatedMoviesState: RequestState.success)),
    );
  }
}
