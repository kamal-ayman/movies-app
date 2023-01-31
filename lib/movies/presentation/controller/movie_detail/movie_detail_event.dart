
import 'package:equatable/equatable.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class GetMovieDetailEvent extends MovieDetailEvent {
  final int id;

  const GetMovieDetailEvent(this.id);

  @override
  List<Object> get props => [
        id,
      ];
}

class GetMovieRecommendationsEvent extends MovieDetailEvent {
  final int id;

  const GetMovieRecommendationsEvent(this.id);

  @override
  List<Object> get props => [
        id,
      ];
}
