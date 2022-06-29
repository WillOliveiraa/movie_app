import 'package:core_module/core_module.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:will_movie_app/src/modules/movie/domain/entities/movie.dart';
import '../repositories/movies_repository.dart';

abstract class IGetMovieNowPlaying {
  Future<Either<Failure, List<Movie>>> call();
}

class GetMovieNowPlaying implements IGetMovieNowPlaying {
  GetMovieNowPlaying(this.repository);

  final MoviesRepository repository;

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getMovieNowPlaying();
  }
}
