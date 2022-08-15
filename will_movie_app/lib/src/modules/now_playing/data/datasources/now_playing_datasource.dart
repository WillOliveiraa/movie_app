import '../../domain/entities/movie.dart';

abstract class NowPlayingDataSource {
  Future<List<Movie>> getMovieNowPlaying();
}
