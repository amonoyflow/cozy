import 'package:cozy/features/search/data/models/city_model.dart';
import 'package:cozy/core/errors/exceptions.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

abstract class SearchLocal {
  Future<List<CityModel>> getSearchCities();
}

class SearchLocalImpl implements SearchLocal {
  @override
  Future<List<CityModel>> getSearchCities() async {
    var cities = List<CityModel>();
    try {
      String jsonString =
          await rootBundle.loadString("assets/json/cities.json");
      Map parseJson = json.decode(jsonString);
      var categoryJson = parseJson["Cities"] as List;
      for (var i = 0; i < categoryJson.length; i++) {
        cities.add(CityModel.fromJson(categoryJson[i]));
      }
      return cities;
    } catch (e) {
      throw CacheException();
    }
  }
}
