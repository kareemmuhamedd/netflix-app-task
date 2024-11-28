import 'package:flutter_netflix_app/home/data/models/show_model.dart';
import 'package:flutter_netflix_app/home/domain/entities/tv_show_response.dart';

class TvShowResponseModel extends TvShowResponse {
  TvShowResponseModel({
    required super.score,
    required super.show,
  });

  factory TvShowResponseModel.fromJson(Map<String, dynamic> json) {
    return TvShowResponseModel(
      score: json['score'].toDouble(),
      show: ShowModel.fromJson(json['show']),
    );
  }
}
