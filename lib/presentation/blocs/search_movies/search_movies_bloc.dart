import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movix/domain/entities/movie.dart';
import 'package:movix/domain/usecases/search_movies.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;
  SearchMoviesBloc({required this.searchMovies}) : super(SearchMoviesInitialState()) {
    on<FetchSearchMoviesEvent>((event, emit) async {
      emit(SearchMoviesLoadingState());
      final failureOrMovies = await searchMovies(event.query);
      failureOrMovies.fold(
          (failure) => emit(SearchMoviesErrorState(failure.toString())),
          (movies) => emit(SearchMoviesLoadedState(movies)));
    });
  }
}
