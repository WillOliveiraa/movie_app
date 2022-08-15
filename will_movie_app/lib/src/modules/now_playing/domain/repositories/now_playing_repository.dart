import 'package:core_module/core_module.dart';
import 'package:dependency_module/dependency_module.dart';

import '../entities/movie.dart';

abstract class NowPlayingRepository {
  Future<Either<Failure, List<Movie>>> getMovieNowPlaying();
}
