import 'package:flutter_netflix_app/details/data/models/self_link_model.dart';
import 'package:flutter_netflix_app/details/data/models/show_link_model.dart';

import '../../domain/entities/links.dart';

class LinksModel extends LinksEntity {
  LinksModel({
    required super.self,
    required super.show,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) {
    return LinksModel(
      self: json['self'] != null ? SelfLinkModel.fromJson(json['self']) : null,
      show: json['show'] != null ? ShowLinkModel.fromJson(json['show']) : null,
    );
  }
}
