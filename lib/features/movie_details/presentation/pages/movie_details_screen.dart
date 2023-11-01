import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_tech_movies/core/extensions/navigation_extenstions.dart';
import 'package:micro_tech_movies/features/movie_details/presentation/bloc/movie_details_bloc.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/widgets/primary_padding.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const id = '/MovieDetailsScreen';

  const MovieDetailsScreen({Key? key}) : super(key: key);

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
    return BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
      listener: (_, state) {},
      builder: (_, state) {
        return PrimaryPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spaces.vertical16(),
            ],
          ),
        );
      },
    );
  }
}