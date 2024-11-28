import 'package:flutter_netflix_app/core/errors/failures.dart';
import 'package:flutter_netflix_app/details/data/models/episode_model.dart';
import 'package:fpdart/src/either.dart';

import '../../../core/errors/exception.dart';
import '../../domain/repository/episodes_repository.dart';
import '../data_source/movie_episodes_remote_data_source.dart';

class EpisodesRepositoryImpl implements EpisodesRepository {
  final MovieEpisodesRemoteDataSource remoteDataSource;

  EpisodesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<EpisodeModel>>> getEpisodes(String url) async {
    try {
      final episodes = await remoteDataSource.getMovieEpisodes(url);
      return right(episodes);
    } on ServerException catch (e) {
      return left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }
}
