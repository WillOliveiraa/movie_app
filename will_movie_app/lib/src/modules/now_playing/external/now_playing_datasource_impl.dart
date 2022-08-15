import 'package:core_module/core_module.dart';
import 'package:dependency_module/dependency_module.dart';

import '../data/adapters/now_playing_adapter.dart';
import '../data/datasources/now_playing_datasource.dart';
import '../domain/entities/movie.dart';
import '../domain/errors/now_playing_failures.dart';

class NowPlayingDataSourceImpl implements NowPlayingDataSource {
  final Dio dio;
  final ApiConfigurations config;

  NowPlayingDataSourceImpl(this.dio, this.config);

  @override
  Future<List<Movie>> getMovieNowPlaying() async {
    try {
      final response = await dio.get(
        'movie/now_playing',
        queryParameters: {
          'api_key': config.apiKey,
          'language': config.language,
        },
      );

      return NowPlayingAdapter.fromMapList(response.data);
    } on DioError catch (e, stackTrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw MovieNowPlayingNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        throw MovieNowPlayingNoInternetConnection();
      } else {
        throw MovieNowPlayingError(stackTrace,
            'NowPlayingDatasourceImpl-getMovieNowPlaying', e, e.toString());
      }
    }
  }
}
