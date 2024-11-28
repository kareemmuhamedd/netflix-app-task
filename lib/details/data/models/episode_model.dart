class EpisodeModel {
  final int? id;
  final String? url;
  final String? name;
  final int? season;
  final int? number;
  final String? type;
  final String? airdate;
  final String? airtime;
  final String? airstamp;
  final int? runtime;
  final RatingModel? rating;
  final ImageDetailsModel? image;
  final String? summary;
  final LinksModel? links;

  EpisodeModel({
    this.id,
    this.url,
    this.name,
    this.season,
    this.number,
    this.type,
    this.airdate,
    this.airtime,
    this.airstamp,
    this.runtime,
    this.rating,
    this.image,
    this.summary,
    this.links,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      season: json['season'] as int?,
      number: json['number'] as int?,
      type: json['type'] as String?,
      airdate: json['airdate'] as String?,
      airtime: json['airtime'] as String?,
      airstamp: json['airstamp'] as String?,
      runtime: json['runtime'] as int?,
      rating: json['rating'] != null ? RatingModel.fromJson(json['rating']) : null,
      image:
          json['image'] != null ? ImageDetailsModel.fromJson(json['image']) : null,
      summary: json['summary'] as String?,
      links: json['_links'] != null ? LinksModel.fromJson(json['_links']) : null,
    );
  }
}

class RatingModel {
  final double? average;

  RatingModel({this.average});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      average: (json['average'] as num?)?.toDouble(),
    );
  }
}

class ImageDetailsModel {
  final String? medium;
  final String? original;

  ImageDetailsModel({this.medium, this.original});

  factory ImageDetailsModel.fromJson(Map<String, dynamic> json) {
    return ImageDetailsModel(
      medium: json['medium'] as String?,
      original: json['original'] as String?,
    );
  }
}

class LinksModel {
  final SelfLink? self;
  final ShowLink? show;

  LinksModel({this.self, this.show});

  factory LinksModel.fromJson(Map<String, dynamic> json) {
    return LinksModel(
      self: json['self'] != null ? SelfLink.fromJson(json['self']) : null,
      show: json['show'] != null ? ShowLink.fromJson(json['show']) : null,
    );
  }
}

class SelfLink {
  final String? href;

  SelfLink({this.href});

  factory SelfLink.fromJson(Map<String, dynamic> json) {
    return SelfLink(
      href: json['href'] as String?,
    );
  }
}

class ShowLink {
  final String? href;
  final String? name;

  ShowLink({this.href, this.name});

  factory ShowLink.fromJson(Map<String, dynamic> json) {
    return ShowLink(
      href: json['href'] as String?,
      name: json['name'] as String?,
    );
  }
}
