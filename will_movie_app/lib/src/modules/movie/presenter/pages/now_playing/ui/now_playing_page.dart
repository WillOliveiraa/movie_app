import 'package:dependency_module/dependency_module.dart' hide State;
import 'package:flutter/material.dart';
import 'package:will_design_system/will_design_system.dart';
import 'package:will_movie_app/src/modules/movie/presenter/pages/now_playing/ui/cubit/now_playing_cubit.dart';
import 'package:will_movie_app/src/modules/movie/presenter/pages/now_playing/ui/cubit/now_playing_state.dart';

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({Key? key}) : super(key: key);

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  final cubit = Modular.get<NowPlayingCubit>();
  @override
  void initState() {
    super.initState();

    cubit.fetchNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing Movies'),
        centerTitle: true,
      ),
      body: BlocProvider<NowPlayingCubit>(
        create: (BuildContext context) => cubit,
        child: BlocConsumer<NowPlayingCubit, NowPlayingState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is NowPlayingLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is NowPlayingErrorState) {
              return const Text('Erro ao tentar fazer a conexão.');
            }

            if (state is NowPlayingSuccessState) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];

                  return CardMovies(
                    image: movie.posterPath,
                    title: movie.title,
                    vote: movie.voteAverage.toString(),
                    releaseDate: movie.releaseDate,
                    overview: movie.overview,
                    genre: movie.genreIds
                        .take(3)
                        .map((id) => GenreChip(id: id))
                        .toList(),
                    onTap: () {},
                  );
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
