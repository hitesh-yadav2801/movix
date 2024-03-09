import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movix/domain/entities/movie.dart';
import 'package:movix/domain/repositories/movie_repository.dart';
import 'package:movix/domain/usecases/search_movies.dart';

import 'get_popular_movies_test.mocks.dart';

void main() {
  late SearchMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() => {
    mockMovieRepository = MockMovieRepository(),
    usecase = SearchMovies(mockMovieRepository),
  });

  final tMoviesList = [
    Movie(
      id: 1,
      title: 'Test Movie 1',
      overview: 'Desc 1',
      posterPath: '/image1',
    ),
    Movie(
      id: 2,
      title: 'Test Movie 2',
      overview: 'Desc 2',
      posterPath: '/image2',
    ),
  ];

  test('should get search movies from the repository', ()  async {
    // arrange
    when(mockMovieRepository.searchMovies(any))
        .thenAnswer((_) async => Right(tMoviesList));

    // act
    const tQuery = 'Inception';
    final result = await usecase(tQuery);

    // assert
    expect(result, equals(Right(tMoviesList)));
    verify(mockMovieRepository.searchMovies(tQuery));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}