import 'package:cozy/features/search/domain/entities/city.dart';

class CityModel extends City {
  final String keyword;
  final int id;
  final String autocompleteterm;
  final String country;

  const CityModel({
    this.keyword,
    this.id,
    this.autocompleteterm,
    this.country,
  }) : super(
          keyword: keyword,
          id: id,
          autocompleteterm: autocompleteterm,
          country: country,
        );

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      keyword: json["keyword"],
      id: json["id"],
      autocompleteterm: json["autocompleteTerm"],
      country: json["country"],
    );
  }
}
