import 'package:flutter_netflix_app/home/domain/entities/link.dart';

class Links {
  final Link self;
  final Link? previousEpisode;

  Links({
    required this.self,
    this.previousEpisode,
  });
}
