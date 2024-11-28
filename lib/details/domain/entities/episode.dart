import 'package:flutter_netflix_app/details/domain/entities/links.dart';
import 'package:flutter_netflix_app/details/domain/entities/rating.dart';

import 'image_details.dart';

class EpisodeEntity {
  final String url;
  final int id;
  final String name;
  final int season;
  final int number;
  final String type;
  final String airdate;
  final String airtime;
  final String airstamp;
  final int runtime;
  final RatingEntity? rating;
  final ImageDetailsEntity? image;
  final String summary;
  final LinksEntity? links;

  EpisodeEntity({
    required this.id,
    required this.name,
    required this.season,
    required this.number,
    required this.type,
    required this.airdate,
    required this.runtime,
    required this.rating,
    required this.image,
    required this.summary,
    required this.links,
    required this.url,
    required this.airtime,
    required this.airstamp,
  });
}






