import 'package:cozy/features/home/domain/entities/property.dart';
import 'package:flutter/material.dart';

class PropertyModel extends Property {
  const PropertyModel({
    @required String location,
    @required int price,
    @required int ratings,
    @required int floorArea,
    @required int beds,
    @required int bathrooms,
  }) : super(
            location: location,
            price: price,
            ratings: ratings,
            floorArea: floorArea,
            beds: beds,
            bathrooms: bathrooms);

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      location: json["location"],
      price: json["price"],
      ratings: json["ratings"],
      floorArea: json["floor_area"],
      beds: json["beds"],
      bathrooms: json["bathrooms"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "location": location,
      "price": price,
      "ratings": ratings,
      "floor_area": floorArea,
      "beds": beds,
      "bathrooms": bathrooms,
    };
  }
}
