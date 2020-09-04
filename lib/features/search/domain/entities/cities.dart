import 'package:flutter/services.dart';
import 'dart:convert';

class Cities {
  final String keyword;
  final int id;
  final String autocompleteterm;
  final String country;

  const Cities({
    this.keyword,
    this.id,
    this.autocompleteterm,
    this.country,
  });

  factory Cities.fromJson(Map<String, dynamic> json) {
    return Cities(
      keyword: json["keyword"],
      id: json["id"],
      autocompleteterm: json["autocompleteTerm"],
      country: json["country"],
    );
  }
}

class CityModels {
  static List<Cities> cities;

  static Future loadCities() async {
    try {
      cities = List<Cities>();
      String jsonString =
          await rootBundle.loadString("assets/json/cities.json");
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson["Cities"] as List;
      for (var i = 0; i < categoryJson.length; i++) {
        cities.add(Cities.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}
