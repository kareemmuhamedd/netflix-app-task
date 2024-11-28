import '../../domain/entities/show_link.dart';

class ShowLinkModel extends ShowLinkEntity {
  ShowLinkModel({
    required super.href,
    required super.name,
  });

  factory ShowLinkModel.fromJson(Map<String, dynamic> json) {
    return ShowLinkModel(
      href: json['href'] as String?,
      name: json['name'] as String?,
    );
  }
}
