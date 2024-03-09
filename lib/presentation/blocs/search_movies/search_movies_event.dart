part of 'search_movies_bloc.dart';

@immutable
abstract class SearchMoviesEvent {}

class FetchSearchMoviesEvent extends SearchMoviesEvent {
  final String query;
  FetchSearchMoviesEvent(this.query);
}
