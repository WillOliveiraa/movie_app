import 'package:will_movie_app/src/modules/movie/domain/entities/movie.dart';

abstract class MovieDataSource {
  Future<List<Movie>> getMovieNowPlaying();
}
