import 'package:flutter_netflix_app/core/errors/failures.dart';
import 'package:flutter_netflix_app/core/usecase/usecase.dart';
import 'package:flutter_netflix_app/details/domain/entities/episode.dart';
import 'package:flutter_netflix_app/details/domain/repository/episodes_repository.dart';
import 'package:fpdart/src/either.dart';

class GetEpisodes implements UseCase<EpisodeEntity, String> {
  final EpisodesRepository episodesRepository;

  GetEpisodes(this.episodesRepository);

  @override
  Future<Either<Failure, EpisodeEntity>> call(String url) async {
    return await episodesRepository.getEpisodes(url);
  }
}
