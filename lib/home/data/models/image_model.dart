import 'package:flutter_netflix_app/home/domain/entities/image.dart';

class ImageModel extends Image {
  ImageModel({
    required super.medium,
    required super.original,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      medium: json['medium'] ?? '',
      original: json['original']??'',
    );
  }
}
