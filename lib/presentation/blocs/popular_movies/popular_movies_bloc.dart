import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movix/domain/entities/movie.dart';
import 'package:movix/domain/usecases/get_popular_movies.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;
  PopularMoviesBloc({required this.getPopularMovies}) : super(PopularMoviesInitialState()) {
    on<FetchPopularMoviesEvent>((event, emit) async {
      emit(PopularMoviesLoadingState());
      final failureOrMovies = await getPopularMovies();
      failureOrMovies.fold(
          (failure) => emit(PopularMoviesErrorState(failure.toString())),
          (movies) => emit(PopularMoviesLoadedState(movies)));
    });
  }
}
