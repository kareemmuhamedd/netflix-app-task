import 'package:flutter_netflix_app/home/domain/entities/network.dart';

import 'country_model.dart';

class NetworkModel extends Network {


  NetworkModel({
    required super.id,
    required super.name,
    required super.country,
    super.officialSite,
  });

  factory NetworkModel.fromJson(Map<String, dynamic> json) {
    return NetworkModel(
      id: json['id'],
      name: json['name'],
      country: CountryModel.fromJson(json['country']),
      officialSite: json['officialSite'],
    );
  }
}