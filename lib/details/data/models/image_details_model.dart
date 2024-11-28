import 'package:flutter_netflix_app/details/domain/entities/image_details.dart';

class ImageDetailsModel extends ImageDetailsEntity {
  ImageDetailsModel({
    required super.medium,
    required super.original,
  });

  factory ImageDetailsModel.fromJson(Map<String, dynamic> json) {
    return ImageDetailsModel(
      medium: json['medium'] as String?,
      original: json['original'] as String?,
    );
  }
}
