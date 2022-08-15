import 'package:core_module/core_module.dart';
import 'package:dependency_module/dependency_module.dart';

import '../home/presenter/pages/home_page.dart';
import 'data/datasources/now_playing_datasource.dart';
import 'data/repositories/now_playing_repository_impl.dart';
import 'domain/repositories/now_playing_repository.dart';
import 'domain/usecases/get_movie_now_playing.dart';
import 'external/now_playing_datasource_impl.dart';
import 'presenter/cubit/now_playing_cubit.dart';

class MovieModule extends Module {
  @override
  List<Bind> get binds => [
        // utils
        Bind.singleton<DioClient>(
            (i) => DioClient(apiBaseUrl: ApiConstant.baseUrlDebug)),
        Bind.singleton<Dio>((i) => i<DioClient>().dio),
        Bind.singleton<ApiConfigurations>((i) => ApiConfigurations()),
        // datasource
        Bind.factory<NowPlayingDataSource>(
            (i) => NowPlayingDataSourceImpl(i(), i())),
        // repositories
        Bind.factory<NowPlayingRepository>(
            (i) => NowPlayingRepositoryImpl(i())),
        // usecases
        Bind.factory<IGetMovieNowPlaying>((i) => GetMovieNowPlaying(i())),
        // cubits
        Bind.singleton((i) => NowPlayingCubit(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            // child: (context, args) => const NowPlayingPage()),
            child: (context, args) => const HomePage()),
      ];
}
