import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movix/domain/entities/movie.dart';
import 'package:movix/domain/usecases/get_trending_movies.dart';

part 'trending_movies_event.dart';

part 'trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies getTrendingMovies;

  TrendingMoviesBloc({required this.getTrendingMovies})
      : super(TrendingMoviesInitialState()) {
    on<FetchTrendingMoviesEvent>((event, emit) async {
      emit(TrendingMoviesLoadingState());
      final failureOrMovies = await getTrendingMovies();
      failureOrMovies.fold(
          (failure) => emit(TrendingMoviesErrorState(failure.toString())),
          (movies) => emit(TrendingMoviesLoadedState(movies)));
    });
  }
}
