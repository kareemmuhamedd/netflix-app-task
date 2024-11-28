import 'package:flutter_netflix_app/home/data/models/link_model.dart';

import '../../domain/entities/links.dart';

class LinksModel extends Links {
  LinksModel({
    required super.self,
    super.previousEpisode,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) {
    return LinksModel(
      self: LinkModel.fromJson(json['self']),
      previousEpisode: json['previousepisode'] != null
          ? LinkModel.fromJson(json['previousepisode'])
          : null,
    );
  }
}
