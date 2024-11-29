import 'package:dio/dio.dart';
import 'package:flutter_netflix_app/core/errors/exception.dart';
import 'package:flutter_netflix_app/home/data/models/tv_show_response_model.dart';

abstract interface class SearchedMoviesRemoteDataSource {
  Future<List<TvShowResponseModel>> getSearchedMovies(String query);
}

class SearchedMoviesRemoteDataSourceImpl
    implements SearchedMoviesRemoteDataSource {
  final Dio _dio;

  SearchedMoviesRemoteDataSourceImpl(this._dio);

  @override
  Future<List<TvShowResponseModel>> getSearchedMovies(String query) async {
    try {
      final response =
          await _dio.get('https://api.tvmaze.com/search/shows?q=$query');
      final List<TvShowResponseModel> tvShowResponse = [];
      for (var item in response.data) {
        tvShowResponse.add(TvShowResponseModel.fromJson(item));
      }
      return tvShowResponse;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
