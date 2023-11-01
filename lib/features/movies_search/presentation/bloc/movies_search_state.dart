part of 'movies_search_bloc.dart';

@immutable
abstract class MoviesSearchState {}

class MoviesSearchInitial extends MoviesSearchState {}

class SearchMoviesLoadingState extends MoviesSearchState {}

class SearchMoviesSuccessState extends MoviesSearchState {
  final List<MovieModel> movies;

  SearchMoviesSuccessState({required this.movies});
}

class SearchMoviesErrorState extends MoviesSearchState {
  final String msg;

  SearchMoviesErrorState({required this.msg});
}

class MovieClickedState extends MoviesSearchState {}