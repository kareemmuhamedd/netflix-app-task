import 'package:flutter_netflix_app/core/errors/exception.dart';
import 'package:flutter_netflix_app/core/errors/failures.dart';
import 'package:flutter_netflix_app/home/data/models/tv_show_response_model.dart';
import 'package:flutter_netflix_app/search/data/data_source/searched_movie_remote_data_source.dart';
import 'package:fpdart/src/either.dart';

import '../../domain/repository/searched_movie_repository.dart';

class SearchedMovieRepositoryImpl implements SearchedMovieRepository {
  SearchedMovieRepositoryImpl(this.searchedMoviesRemoteDataSource);

  final SearchedMoviesRemoteDataSource searchedMoviesRemoteDataSource;

  @override
  Future<Either<Failure, List<TvShowResponseModel>>> getSearchedMovies(
      String query) async {
    try {
      final movies =
          await searchedMoviesRemoteDataSource.getSearchedMovies(query);
      return right(movies);
    } on ServerException catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
