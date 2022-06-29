import 'package:core_module/core_module.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:will_movie_app/src/modules/movie/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getMovieNowPlaying();
}
