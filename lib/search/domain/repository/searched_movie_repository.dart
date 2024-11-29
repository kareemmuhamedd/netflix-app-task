import 'package:flutter_netflix_app/home/domain/entities/tv_show_response.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/errors/failures.dart';

abstract interface class SearchedMovieRepository {
  Future<Either<Failure, List<TvShowResponse>>> getSearchedMovies(String query);
}
