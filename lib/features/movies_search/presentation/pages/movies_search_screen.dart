import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_tech_movies/core/extensions/navigation_extenstions.dart';
import 'package:micro_tech_movies/core/utils/network_utils/api_endpoints.dart';
import 'package:micro_tech_movies/core/widgets/empty_state_widget.dart';
import 'package:micro_tech_movies/core/widgets/loading_widget.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/primary_padding.dart';
import '../bloc/movies_search_bloc.dart';
import '../widget/movie_grid_item_widget.dart';

class MoviesSearchScreen extends StatelessWidget {
  static const id = '/MoviesSearchScreen';

  const MoviesSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MoviesSearchPage(),
    );
  }
}

class MoviesSearchPage extends StatelessWidget {
  const MoviesSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesSearchBloc, MoviesSearchState>(
      listener: (_, state) {},
      builder: (_, state) {
        if (state is SearchMoviesLoadingState || state is MoviesSearchInitial) {
          if (state is MoviesSearchInitial) moviesSearchBloc.add(SearchMoviesEvent(keyword: ''));
          return const LoadingWidget();
        } else if (state is SearchMoviesSuccessState) {
          if ((state).movies.isEmpty) {
            return const EmptyStateWidget();
          } else {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
              ),
              itemCount: state.movies.length,
              itemBuilder: (_, i) {
                return MovieGridItemWidget(movie: state.movies[i]);
              },
            );
          }
        } else {
          return const ErrWidget();
        }
      },
    );
  }
}