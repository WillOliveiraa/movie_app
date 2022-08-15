import 'dart:convert';

import 'package:core_module/core_module.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:will_movie_app/src/modules/now_playing/data/datasources/now_playing_datasource.dart';
import 'package:will_movie_app/src/modules/now_playing/domain/entities/movie.dart';
import 'package:will_movie_app/src/modules/now_playing/domain/errors/now_playing_failures.dart';
import 'package:will_movie_app/src/modules/now_playing/external/now_playing_datasource_impl.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Dio dioInstance;
  late NowPlayingDataSource dataSource;

  setUpAll(() {
    dioInstance = DioMock();
    dataSource = NowPlayingDataSourceImpl(dioInstance, ApiConfigurations());
  });

  test('Should return a list of movies now playing', () async {
    when(() => dioInstance.get(any(),
        queryParameters: any(named: 'queryParameters'))).thenAnswer(
      (_) async =>
          Response(data: moviesJson, requestOptions: RequestOptions(path: '')),
    );

    final result = await dataSource.getMovieNowPlaying();

    expect(result, isA<List<Movie>>());
    expect(result.length, 3);
  });

  test('Should return a MovieNowPlayingNoInternetConnection error', () async {
    when(() => dioInstance.get(any(),
        queryParameters: any(named: 'queryParameters'))).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      type: DioErrorType.connectTimeout,
    ));

    try {
      await dataSource.getMovieNowPlaying();
    } catch (e) {
      expect(e, isA<MovieNowPlayingNoInternetConnection>());
    }
  });

  test('Should return a MovieNowPlayingError error', () async {
    when(() => dioInstance.get(any(),
        queryParameters: any(named: 'queryParameters'))).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      type: DioErrorType.response,
    ));

    try {
      await dataSource.getMovieNowPlaying();
    } catch (e) {
      expect(e, isA<MovieNowPlayingError>());
    }
  });
}

final moviesJson = jsonDecode(
    r'''
{
  "page": 1,
  "results": [
    {
      "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
      "adult": false,
      "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
      "release_date": "2016-08-03",
      "genre_ids": [
        14,
        28,
        80
      ],
      "id": 297761,
      "original_title": "Suicide Squad",
      "original_language": "en",
      "title": "Suicide Squad",
      "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg",
      "popularity": 48.261451,
      "vote_count": 1466,
      "video": false,
      "vote_average": 5.91
    },
    {
      "poster_path": "/lFSSLTlFozwpaGlO31OoUeirBgQ.jpg",
      "adult": false,
      "overview": "The most dangerous former operative of the CIA is drawn out of hiding to uncover hidden truths about his past.",
      "release_date": "2016-07-27",
      "genre_ids": [
        28,
        53
      ],
      "id": 324668,
      "original_title": "Jason Bourne",
      "original_language": "en",
      "title": "Jason Bourne",
      "backdrop_path": "/AoT2YrJUJlg5vKE3iMOLvHlTd3m.jpg",
      "popularity": 30.690177,
      "vote_count": 649,
      "video": false,
      "vote_average": 5.25
    },
    {
      "poster_path": "/tgfRDJs5PFW20Aoh1orEzuxW8cN.jpg",
      "adult": false,
      "overview": "Arthur Bishop thought he had put his murderous past behind him when his most formidable foe kidnaps the love of his life. Now he is forced to travel the globe to complete three impossible assassinations, and do what he does best, make them look like accidents.",
      "release_date": "2016-08-25",
      "genre_ids": [
        80,
        28,
        53
      ],
      "id": 278924,
      "original_title": "Mechanic: Resurrection",
      "original_language": "en",
      "title": "Mechanic: Resurrection",
      "backdrop_path": "/3oRHlbxMLBXHfMqUsx1emwqiuQ3.jpg",
      "popularity": 20.375179,
      "vote_count": 119,
      "video": false,
      "vote_average": 4.59
    }
  ]
}
''');
