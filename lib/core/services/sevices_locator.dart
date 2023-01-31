import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/data/repository/movies_repository.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';
import 'package:movies/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movies/movies/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controller/movie_detail/movie_detail_bloc.dart';
import 'package:movies/movies/presentation/controller/movies/movies_bloc.dart';

final sl = GetIt.instance;


class ServicesLocator {
  void init (){
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailBloc(sl(), sl()));
    /// USE CASES
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieRecommendationsUseCase(sl()));
    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}