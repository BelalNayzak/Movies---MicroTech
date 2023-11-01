import '../../../../core/error/failures.dart';
import '../../data/model/movie_model.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesSearchRepo {
  Future<Either<Failure, List<MovieModel>>> getSearchedMovies();
}