import 'package:movix/core/errors/server_failure.dart';
import 'package:movix/domain/entities/movie.dart';
import 'package:movix/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<ServerFailure,List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}