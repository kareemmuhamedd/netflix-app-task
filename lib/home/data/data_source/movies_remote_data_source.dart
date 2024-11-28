import 'package:dio/dio.dart';
import 'package:flutter_netflix_app/core/errors/exception.dart';
import 'package:flutter_netflix_app/home/data/models/tv_show_response_model.dart';

abstract interface class MoviesRemoteDataSource {
  Future<List<TvShowResponseModel>> getMovies();
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final Dio _dio;

  MoviesRemoteDataSourceImpl(this._dio);

  @override
  Future<List<TvShowResponseModel>> getMovies() async {
    //try{
      final response = await _dio.get('https://api.tvmaze.com/search/shows?q=all');
      final List<TvShowResponseModel> tvShowResponse = [];
      for (var item in response.data) {
        tvShowResponse.add(TvShowResponseModel.fromJson(item));
      }
      return tvShowResponse;
    // }
    // catch(e){
    //   print('i found an error in data source');
    //   print(e.toString());
    //   throw ServerException(e.toString());
    // }
  }
}

