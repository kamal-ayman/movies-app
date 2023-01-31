import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

import '../entities/movie_detail.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetail, MovieDetailUseCaseParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailUseCaseParameters parameters) async {
    return await baseMoviesRepository.getMovieDetail(parameters);
  }
}

class MovieDetailUseCaseParameters extends Equatable {
  final int id;

  const MovieDetailUseCaseParameters({required this.id});

  @override
  List<Object?> get props => [
        id,
      ];
}
