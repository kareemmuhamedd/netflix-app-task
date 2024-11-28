import 'package:flutter_netflix_app/home/data/models/show_model.dart';

class TvShowResponse {
  final double score;
  final ShowModel show;

  TvShowResponse({
    required this.score,
    required this.show,
  });
}
