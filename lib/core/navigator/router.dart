import 'package:flutter/material.dart';

import '../../features/movie_details/presentation/pages/movie_details_screen.dart';
import '../../features/movies_search/presentation/pages/movies_search_screen.dart';

class Routing {
  static Map<String, Widget Function(BuildContext)> appRoutes(context) {
    return {
      MoviesSearchScreen.id: (_) => const MoviesSearchScreen(),
      MovieDetailsScreen.id: (_) => const MovieDetailsScreen(),
    };
  }
}