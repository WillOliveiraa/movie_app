import 'package:core_module/core_module.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:will_movie_app/src/modules/movie/data/adapters/movie_adapter.dart';
import 'package:will_movie_app/src/modules/movie/data/datasources/movie_datasource.dart';
import 'package:will_movie_app/src/modules/movie/domain/entities/movie.dart';

import '../domain/errors/movie_failures.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final Dio dio;
  final ApiConfigurations config;

  MovieDataSourceImpl(this.dio, this.config);

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

      return MovieAdapter.fromMapList(response.data);
    } on DioError catch (e, stackTrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw MovieNowPlayingNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        throw MovieNowPlayingNoInternetConnection();
      } else {
        throw MovieNowPlayingError(stackTrace,
            'MovieDatasourceImpl-getMovieNowPlaying', e, e.toString());
      }
    }
  }
}
