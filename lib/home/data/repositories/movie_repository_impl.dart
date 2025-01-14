import 'package:flutter_netflix_app/core/errors/exception.dart';
import 'package:flutter_netflix_app/core/errors/failures.dart';
import 'package:flutter_netflix_app/home/data/models/tv_show_response_model.dart';
import 'package:flutter_netflix_app/home/domain/repository/movie_repository.dart';
import 'package:fpdart/src/either.dart';

import '../data_source/movies_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this.moviesRemoteDataSource);

  final MoviesRemoteDataSource moviesRemoteDataSource;

  @override
  Future<Either<Failure, List<TvShowResponseModel>>> getMovies() async {
    try {
      final movies = await moviesRemoteDataSource.getMovies();
      return right(movies);
    } on ServerException catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
