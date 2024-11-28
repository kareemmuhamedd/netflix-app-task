import 'package:flutter_netflix_app/home/domain/entities/country.dart';

class CountryModel extends Country {
  CountryModel({
    required super.name,
    required super.code,
    required super.timezone,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']??'',
      code: json['code']??'',
      timezone: json['timezone']??'',
    );
  }
}
