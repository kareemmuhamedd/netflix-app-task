import 'package:flutter_netflix_app/home/data/models/image_model.dart';
import 'package:flutter_netflix_app/home/data/models/rating_model.dart';
import 'package:flutter_netflix_app/home/data/models/schedule_model.dart';
import 'externals.dart';
import 'links.dart';
import 'network.dart';

class Show {
  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final ScheduleModel schedule;
  final RatingModel rating;
  final int weight;
  final Network? network;
  final dynamic webChannel;
  final dynamic dvdCountry;
  final Externals externals;
  final ImageModel image;
  final String summary;
  final int updated;
  final Links links;

  Show({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    this.runtime,
    this.averageRuntime,
    required this.premiered,
    this.ended,
    this.officialSite,
    required this.schedule,
    required this.rating,
    required this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    required this.externals,
    required this.image,
    required this.summary,
    required this.updated,
    required this.links,
  });
}
