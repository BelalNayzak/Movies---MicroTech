import 'package:micro_tech_movies/features/movies_search/data/model/movie_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/internet_connection/network_status.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/movies_search_repo.dart';
import '../datasources/movies_remote_datasource.dart';

class SearchMoviesRepoImpl implements MoviesSearchRepo {
  final MoviesRemoteDataSource moviesRemoteDataSource;
  final NetworkStatus networkStatus;

  SearchMoviesRepoImpl({required this.moviesRemoteDataSource, required this.networkStatus});

  @override
  Future<Either<Failure, List<MovieModel>>> getSearchedMovies() async {
    if (!await networkStatus.isConnected) {
      return Left(NoInternetFailure(message: 'No internet connection.'));
    }

    return moviesRemoteDataSource.getSearchedMovies();
  }
}