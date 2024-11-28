import 'package:flutter_netflix_app/details/domain/entities/episode.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/errors/failures.dart';

abstract interface class EpisodesRepository {
  Future<Either<Failure, EpisodeEntity>> getEpisodes(String url);
}
