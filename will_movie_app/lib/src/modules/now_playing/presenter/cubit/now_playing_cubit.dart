import 'package:dependency_module/dependency_module.dart';

import '../../domain/usecases/get_movie_now_playing.dart';
import 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit(this.getMovieNowPlaying) : super(NowPlayingInitialState());

  final IGetMovieNowPlaying getMovieNowPlaying;

  Future<void> fetchNowPlaying() async {
    emit(NowPlayingLoadingState());

    final result = await getMovieNowPlaying.call();

    emit(result.fold(
        (l) => NowPlayingErrorState(l), (r) => NowPlayingSuccessState(r)));
  }
}
