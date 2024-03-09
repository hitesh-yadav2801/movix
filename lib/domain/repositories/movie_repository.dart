import 'package:movix/core/errors/server_failure.dart';
import 'package:movix/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<ServerFailure,List<Movie>>> getTrendingMovies();

  Future<Either<ServerFailure,List<Movie>>> searchMovies(String query);

  Future<Either<ServerFailure,List<Movie>>> getPopularMovies();
}
