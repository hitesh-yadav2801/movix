import 'package:movix/core/errors/server_failure.dart';
import 'package:movix/domain/entities/movie.dart';
import 'package:movix/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';



class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<Either<ServerFailure,List<Movie>>> call() async {
    return await repository.getPopularMovies();
  }
}