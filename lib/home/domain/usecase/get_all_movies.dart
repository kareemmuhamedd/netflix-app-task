import 'package:flutter_netflix_app/core/usecase/usecase.dart';
import 'package:flutter_netflix_app/home/domain/entities/tv_show_response.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/errors/failures.dart';
import '../repository/movie_repository.dart';

class GetAllMovies implements UseCase<List<TvShowResponse>, NoParams> {
  final MovieRepository movieRepository;

  GetAllMovies(this.movieRepository);

  @override
  Future<Either<Failure, List<TvShowResponse>>> call(NoParams params) async {
    return await movieRepository.getMovies();
  }
}
