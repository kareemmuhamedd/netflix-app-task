import 'package:flutter_netflix_app/details/domain/entities/self_link.dart';
import 'package:flutter_netflix_app/details/domain/entities/show_link.dart';

class LinksEntity {
  final SelfLinkEntity? self;
  final ShowLinkEntity? show;

  LinksEntity({
    this.self,
    this.show,
  });
}
