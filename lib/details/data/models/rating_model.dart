import 'package:flutter_netflix_app/details/domain/entities/rating.dart';

class RatingModel extends RatingEntity {
  RatingModel({required super.average});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      average: (json['average'] as num?)?.toDouble(),
    );
  }
}
