import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie.dart';


class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMoviesMessage;

  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String popularMoviesMessage;

  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMoviesMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMoviesMessage = '',

    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMoviesMessage = '',

    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMoviesMessage = '',
  });


  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingMoviesState,
    String? nowPlayingMoviesMessage,

    List<Movie>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMoviesMessage,

    List<Movie>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMoviesMessage,
  }) => MoviesState(
      nowPlayingMoviesState: nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      nowPlayingMoviesMessage: nowPlayingMoviesMessage ?? this.nowPlayingMoviesMessage,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,

      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesMessage:  popularMoviesMessage ?? this.popularMoviesMessage,
      popularMoviesState:  popularMoviesState ?? this.popularMoviesState,

      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesMessage:  topRatedMoviesMessage ?? this.topRatedMoviesMessage,
      topRatedMoviesState:  topRatedMoviesState ?? this.topRatedMoviesState,
    );


  @override
  List<Object?> get props =>
      [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMoviesMessage,

        popularMovies,
        popularMoviesState,
        popularMoviesMessage,

        topRatedMovies,
        topRatedMoviesState,
        topRatedMoviesMessage,
      ];
}
