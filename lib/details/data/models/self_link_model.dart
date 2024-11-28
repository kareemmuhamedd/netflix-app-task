import '../../domain/entities/self_link.dart';

class SelfLinkModel extends SelfLinkEntity {
  SelfLinkModel({required super.href});

  factory SelfLinkModel.fromJson(Map<String, dynamic> json) {
    return SelfLinkModel(
      href: json['href'] as String?,
    );
  }
}
