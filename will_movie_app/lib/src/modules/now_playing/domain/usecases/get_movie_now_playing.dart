import 'package:core_module/core_module.dart';
import 'package:dependency_module/dependency_module.dart';

import '../entities/movie.dart';
import '../repositories/now_playing_repository.dart';

abstract class IGetMovieNowPlaying {
  Future<Either<Failure, List<Movie>>> call();
}

class GetMovieNowPlaying implements IGetMovieNowPlaying {
  GetMovieNowPlaying(this.repository);

  final NowPlayingRepository repository;

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getMovieNowPlaying();
  }
}
