import 'package:movix/core/errors/server_failure.dart';
import 'package:movix/data/repositories/movie_repository_impl.dart';
import 'package:movix/domain/entities/movie.dart';
import 'package:movix/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetTrendingMovies {
  final MovieRepository repository;

  GetTrendingMovies(this.repository);

  Future<Either<ServerFailure,List<Movie>>> call() async {
    return await repository.getTrendingMovies();
  }
}