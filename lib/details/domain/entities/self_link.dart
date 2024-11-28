class SelfLinkEntity {
  final String? href;

  SelfLinkEntity({this.href});

  factory SelfLinkEntity.fromJson(Map<String, dynamic> json) {
    return SelfLinkEntity(
      href: json['href'] as String?,
    );
  }
}