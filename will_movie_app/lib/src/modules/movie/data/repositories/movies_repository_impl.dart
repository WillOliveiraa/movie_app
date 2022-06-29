import 'package:core_module/core_module.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:will_movie_app/src/modules/movie/domain/entities/movie.dart';
import 'package:will_movie_app/src/modules/movie/domain/errors/movie_failures.dart';
import 'package:will_movie_app/src/modules/movie/domain/repositories/movies_repository.dart';

import '../datasources/movie_datasource.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MovieDataSource _datasource;

  MoviesRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, List<Movie>>> getMovieNowPlaying() async {
    try {
      final result = await _datasource.getMovieNowPlaying();

      if (result.isEmpty) return Left(NoDataFound());

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
