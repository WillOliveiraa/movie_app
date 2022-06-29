import 'package:core_module/core_module.dart';
import 'package:will_movie_app/src/modules/movie/domain/entities/movie.dart';

abstract class NowPlayingState {
  const NowPlayingState();
}

class NowPlayingInitialState extends NowPlayingState {}

class NowPlayingLoadingState extends NowPlayingState {}

class NowPlayingErrorState extends NowPlayingState {
  final Failure error;

  NowPlayingErrorState(this.error);
}

class NowPlayingSuccessState extends NowPlayingState {
  final List<Movie> movies;

  NowPlayingSuccessState(this.movies);
}
