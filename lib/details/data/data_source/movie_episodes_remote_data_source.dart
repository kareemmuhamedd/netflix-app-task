import 'package:dio/dio.dart';
import 'package:flutter_netflix_app/details/data/models/episode_model.dart';

import '../../../core/errors/exception.dart';

abstract interface class MovieEpisodesRemoteDataSource {
  Future<List<EpisodeModel>> getMovieEpisodes(String url);
}

class MovieEpisodesRemoteDataSourceImpl implements MovieEpisodesRemoteDataSource {
  final Dio _dio;

  MovieEpisodesRemoteDataSourceImpl(this._dio);

  @override
  Future<List<EpisodeModel>> getMovieEpisodes(String url) async {
    try {
      final response = await _dio.get(url);
      final List<EpisodeModel> episodes = [];
      for (var item in response.data) {
        episodes.add(EpisodeModel.fromJson(item));
      }
      return episodes;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}