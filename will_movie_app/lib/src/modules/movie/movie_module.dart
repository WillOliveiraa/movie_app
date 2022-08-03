import 'package:core_module/core_module.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:will_movie_app/src/modules/movie/domain/repositories/movies_repository.dart';
import 'package:will_movie_app/src/modules/movie/external/movie_datasource_impl.dart';
import 'package:will_movie_app/src/modules/movie/presenter/pages/now_playing/ui/cubit/now_playing_cubit.dart';
import 'package:will_movie_app/src/modules/movie/presenter/pages/now_playing/ui/now_playing_page.dart';

import 'data/datasources/movie_datasource.dart';
import 'data/repositories/movies_repository_impl.dart';
import 'domain/usecases/get_movie_now_playing.dart';

class MovieModule extends Module {
  @override
  List<Bind> get binds => [
        // utils
        Bind.singleton<DioClient>(
            (i) => DioClient(apiBaseUrl: ApiConstant.baseUrlDebug)),
        Bind.singleton<Dio>((i) => i<DioClient>().dio),
        Bind.singleton<ApiConfigurations>((i) => ApiConfigurations()),
        // datasource
        Bind.factory<MovieDataSource>((i) => MovieDataSourceImpl(i(), i())),
        // repositories
        Bind.factory<MoviesRepository>((i) => MoviesRepositoryImpl(i())),
        // usecases
        Bind.factory<IGetMovieNowPlaying>((i) => GetMovieNowPlaying(i())),
        // cubits
        Bind.singleton((i) => NowPlayingCubit(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const NowPlayingPage()),
        // child: (context, args) => const HomePage()),
      ];
}
