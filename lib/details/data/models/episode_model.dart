import 'package:flutter_netflix_app/details/data/models/links_model.dart';
import 'package:flutter_netflix_app/details/data/models/rating_model.dart';

import '../../domain/entities/episode.dart';
import 'image_details_model.dart';

class EpisodeModel extends EpisodeEntity {
  EpisodeModel({
    required super.id,
    required super.url,
    required super.name,
    required super.season,
    required super.number,
    required super.type,
    required super.airdate,
    required super.airtime,
    required super.airstamp,
    required super.runtime,
    required super.rating,
    required super.image,
    required super.summary,
    required super.links,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      season: json['season'] as int,
      number: json['number'] as int,
      type: json['type'] as String,
      airdate: json['airdate'] as String,
      airtime: json['airtime'] as String,
      airstamp: json['airstamp'] as String,
      runtime: json['runtime'] as int,
      rating:
          json['rating'] != null ? RatingModel.fromJson(json['rating']) : null,
      image: json['image'] != null
          ? ImageDetailsModel.fromJson(json['image'])
          : null,
      summary: json['summary'] ?? '',
      links:
          json['_links'] != null ? LinksModel.fromJson(json['_links']) : null,
    );
  }
}
