import 'package:dependency_module/dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:will_movie_app/src/modules/movie/domain/entities/movie.dart';
import 'package:will_movie_app/src/modules/movie/domain/repositories/movies_repository.dart';
import 'package:will_movie_app/src/modules/movie/domain/usecases/get_movie_now_playing.dart';

class MoviesRepositoryMock extends Mock implements MoviesRepository {}

void main() {
  final repository = MoviesRepositoryMock();
  final usecase = GetMovieNowPlaying(repository);

  test('Should return a movies list', () async {
    when(() => repository.getMovieNowPlaying())
        .thenAnswer((_) async => right([]));

    final result = await usecase();

    expect(result.fold(id, id), isA<List<Movie>>());
  });
}
