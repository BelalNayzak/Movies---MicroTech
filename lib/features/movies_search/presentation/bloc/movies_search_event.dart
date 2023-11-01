part of 'movies_search_bloc.dart';

@immutable
abstract class MoviesSearchEvent {}

class SearchMoviesEvent extends MoviesSearchEvent {
  final String keyword;

  SearchMoviesEvent({required this.keyword});
}

class ClickMovieEvent extends MoviesSearchEvent {}