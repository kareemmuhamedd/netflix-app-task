import 'package:flutter_netflix_app/core/usecase/usecase.dart';
import 'package:flutter_netflix_app/home/domain/entities/tv_show_response.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/errors/failures.dart';
import '../repository/searched_movie_repository.dart';

class GetSearchedMovies implements UseCase<List<TvShowResponse>, String> {
  final SearchedMovieRepository searchedMovieRepository;

  GetSearchedMovies(this.searchedMovieRepository);

  @override
  Future<Either<Failure, List<TvShowResponse>>> call(String query) async {
    return await searchedMovieRepository.getSearchedMovies(query);
  }
}
