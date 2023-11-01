import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:micro_tech_movies/features/movies_search/domain/usecases/search_movies_usecase.dart';

import '../../../../main.dart';
import '../../data/model/movie_model.dart';

part 'movies_search_event.dart';
part 'movies_search_state.dart';

MoviesSearchBloc get moviesSearchBloc => MoviesSearchBloc.get(navigatorKey.currentContext!);

class MoviesSearchBloc extends Bloc<MoviesSearchEvent, MoviesSearchState> {
  static MoviesSearchBloc get(context) => BlocProvider.of(context);

  final SearchMoviesUseCase searchMoviesUseCase;

  MoviesSearchBloc({required this.searchMoviesUseCase}) : super(MoviesSearchInitial()) {
    on<MoviesSearchEvent>((event, emit) {
      if (event is SearchMoviesEvent) {
        searchMoviesUseCase.call();
        emit(SearchMoviesLoadingState());
      } else if (event is ClickMovieEvent) {
        emit(MovieClickedState());
      }
    });
  }
}