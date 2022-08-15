import 'package:core_module/core_module.dart';
import 'package:dependency_module/dependency_module.dart';

import '../../domain/entities/movie.dart';
import '../../domain/errors/now_playing_failures.dart';
import '../../domain/repositories/now_playing_repository.dart';
import '../datasources/now_playing_datasource.dart';

class NowPlayingRepositoryImpl implements NowPlayingRepository {
  final NowPlayingDataSource _datasource;

  NowPlayingRepositoryImpl(this._datasource);

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
