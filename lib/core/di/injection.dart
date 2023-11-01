import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:micro_tech_movies/core/internet_connection/network_status.dart';
import 'package:micro_tech_movies/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:micro_tech_movies/features/movies_search/domain/usecases/search_movies_usecase.dart';
import 'package:micro_tech_movies/features/movies_search/presentation/bloc/movies_search_bloc.dart';
import '../../features/movies_search/data/datasources/movies_remote_datasource.dart';
import '../../features/movies_search/data/repository/search_movies_repo_impl.dart';
import '../../features/movies_search/domain/repository/movies_search_repo.dart';
import '../utils/network_utils/dio_helper.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///* movie details

  sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc());

  ///* movie search

  sl.registerFactory<MoviesSearchBloc>(() => MoviesSearchBloc(searchMoviesUseCase: sl()));

  sl.registerLazySingleton<SearchMoviesUseCase>(() => SearchMoviesUseCase(moviesSearchRepo: sl()));

  sl.registerLazySingleton<MoviesSearchRepo>(
      () => SearchMoviesRepoImpl(moviesRemoteDataSource: sl(), networkStatus: sl()));

  sl.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(dioHelper: sl()));

  sl.registerLazySingleton<DioHelper>(() => DioImpl());

  ///* general

  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImpl(internetChecker: sl()));

  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
}