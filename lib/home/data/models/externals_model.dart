import 'package:flutter_netflix_app/home/domain/entities/externals.dart';

class ExternalsModel extends Externals {


  ExternalsModel({
    super.tvrage,
    super.thetvdb,
    super.imdb,
  });

  factory ExternalsModel.fromJson(Map<String, dynamic> json) {
    return ExternalsModel(
      tvrage: json['tvrage'],
      thetvdb: json['thetvdb'],
      imdb: json['imdb'],
    );
  }
}