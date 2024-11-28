import 'package:flutter_netflix_app/home/domain/entities/rating.dart';

class RatingModel extends Rating{
 

  RatingModel({super.average});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      average: json['average']?.toDouble(),
    );
  }
}