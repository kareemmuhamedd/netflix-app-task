import 'package:flutter_netflix_app/home/data/models/rating_model.dart';
import 'package:flutter_netflix_app/home/data/models/schedule_model.dart';

import '../../domain/entities/show.dart';
import 'externals_model.dart';
import 'image_model.dart';
import 'links_model.dart';
import 'network_model.dart';

class ShowModel extends Show {
  ShowModel({
    required super.id,
    required super.url,
    required super.name,
    required super.type,
    required super.language,
    required super.genres,
    required super.status,
    super.runtime,
    super.averageRuntime,
    required super.premiered,
    super.ended,
    super.officialSite,
    required super.schedule,
    required super.rating,
    required super.weight,
    super.network,
    super.webChannel,
    super.dvdCountry,
    required super.externals,
    required super.image,
    required super.summary,
    required super.updated,
    required super.links,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) {
    return ShowModel(
      id: json['id'],
      url: json['url'] ?? '', // Default to an empty string if null
      name: json['name'] ?? '', // Default to an empty string if null
      type: json['type'] ?? '', // Default to an empty string if null
      language: json['language'] ?? '', // Default to an empty string if null
      genres: List<String>.from(json['genres'] ?? []), // Default to an empty list if null
      status: json['status'] ?? '', // Default to an empty string if null
      runtime: json['runtime'], // Keep null if runtime is not present
      averageRuntime: json['averageRuntime'], // Keep null if averageRuntime is not present
      premiered: json['premiered'] ?? '', // Default to an empty string if null
      ended: json['ended'], // Nullable field
      officialSite: json['officialSite'], // Nullable field
      schedule: ScheduleModel.fromJson(json['schedule'] ?? {}),
      rating: RatingModel.fromJson(json['rating'] ?? {}),
      weight: json['weight'] ?? 0, // Default to 0 if null
      network: json['network'] != null ? NetworkModel.fromJson(json['network']) : null, // Handle null network
      webChannel: json['webChannel'], // Nullable field
      dvdCountry: json['dvdCountry'], // Nullable field
      externals: ExternalsModel.fromJson(json['externals'] ?? {}),
      image: ImageModel.fromJson(json['image'] ?? {}),
      summary: json['summary'] ?? '', // Default to an empty string if null
      updated: json['updated'] ?? 0, // Default to 0 if null
      links: LinksModel.fromJson(json['_links'] ?? {}),
    );
  }
}
