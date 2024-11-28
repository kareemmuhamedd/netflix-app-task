import 'country.dart';

class Network {
  final int id;
  final String name;
  final Country country;
  final String? officialSite;

  Network({
    required this.id,
    required this.name,
    required this.country,
    this.officialSite,
  });
}
