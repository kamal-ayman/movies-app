class ApiConstance {
  static const String baseUrlMovie = "https://api.themoviedb.org/3/movie";
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/original';
  static const String apiKey = "26c6e22d24478131d9cbd6acc6f56caf";

  static const String nowPlayingMoviesPath = "$baseUrlMovie/now_playing";
  static const String nowPopularMoviesPath = "$baseUrlMovie/popular";
  static const String nowTopRatedMoviesPath = "$baseUrlMovie/top_rated";

  static String movieDetailPath(int id) => "$baseUrlMovie/$id";
  static String movieRecommendationsPath(int id) => "$baseUrlMovie/$id/recommendations";



  static String imageUrl(String path) => '$baseImageUrl$path';
}
