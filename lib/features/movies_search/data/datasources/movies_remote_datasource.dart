import 'package:dio/dio.dart';
import 'package:micro_tech_movies/features/movies_search/data/model/get_search_movies_response_model.dart';
import 'package:micro_tech_movies/features/movies_search/data/model/movie_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/debugging_utils/debugging_helper.dart';
import '../../../../core/utils/network_utils/api_endpoints.dart';
import '../../../../core/utils/network_utils/dio_helper.dart';
import 'package:dartz/dartz.dart';

// Note: there could be more than 1 datasource exist (ex. if we use 2 apis or may be we have data on fire base as well)
// so that it's useful to make things abstract and implement with our needs
abstract class MoviesRemoteDataSource {
  Future<Either<Failure, List<MovieModel>>> getSearchedMovies();
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final DioHelper dioHelper;

  MoviesRemoteDataSourceImpl({required this.dioHelper});

  @override
  Future<Either<Failure, List<MovieModel>>> getSearchedMovies() async {
    return _basicErrorHandling<List<MovieModel>>(
      onSuccess: () async {
        final Response f = await dioHelper.get(
          token: apiToken,
          url: '$searchMoviesEndPoint',
        );

        GetSearchMoviesResponseModel response = GetSearchMoviesResponseModel.fromJson(f.data);
        return response.movies ?? [];
      },
      onServerError: (exception) async {
        return ServerFailure(error: 'Server Error', code: 500, message: 'Server Error');
      },
    );
  }
}

// Note: extension for handling remote requests errors with its callbacks
extension on MoviesRemoteDataSource {
  Future<Either<Failure, T>> _basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<Failure> Function(ServerException exception)? onServerError,
    Future<Failure> Function(CacheException exception)? onCacheError,
    Future<Failure> Function(dynamic exception)? onOtherError,
  }) async {
    try {
      final f = await onSuccess();
      return Right(f);
    } on ServerException catch (e, s) {
      // recordError(e, s);
      debugPrinter(s.toString());
      if (onServerError != null) {
        final f = await onServerError(e);
        return Left(f);
      }
      return Left(ServerFailure(error: 'Server Error', code: 500, message: 'Server Error'));
    } on CacheException catch (e, s) {
      // recordError(e, s);
      debugPrinter(e.toString());
      if (onCacheError != null) {
        final f = await onCacheError(e);
        return Left(f);
      }
      return Left(CacheFailure(message: 'No cache failure'));
    } catch (e, s) {
      // recordError(e, s);
      debugPrinter(s.toString());
      if (onOtherError != null) {
        final f = await onOtherError(e);
        return Left(f);
      }
      return Left(UnexpectedFailure(message: 'unexpected failure'));
    }
  }
}