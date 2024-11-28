import '../../domain/entities/link.dart';

class LinkModel extends Link {


  LinkModel({required super.href});

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(href: json['href']);
  }
}