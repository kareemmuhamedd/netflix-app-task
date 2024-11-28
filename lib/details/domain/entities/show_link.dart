class ShowLinkEntity {
  final String? href;
  final String? name;

  ShowLinkEntity({this.href, this.name});

  factory ShowLinkEntity.fromJson(Map<String, dynamic> json) {
    return ShowLinkEntity(
      href: json['href'] as String?,
      name: json['name'] as String?,
    );
  }
}