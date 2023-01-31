import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
