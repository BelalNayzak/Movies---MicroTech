import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/model/movie_model.dart';
import '../repository/movies_search_repo.dart';

class SearchMoviesUseCase {
  final MoviesSearchRepo moviesSearchRepo;

  const SearchMoviesUseCase({required this.moviesSearchRepo});

  Future<Either<Failure, List<MovieModel>>> call() async {
    return await moviesSearchRepo.getSearchedMovies();
  }
}