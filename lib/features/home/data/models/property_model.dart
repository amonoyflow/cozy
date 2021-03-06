import 'package:cozy/features/home/domain/entities/property.dart';

class PropertyModel extends Property {
  const PropertyModel({
    String location,
    String city,
    int price,
    int ratings,
    int floorArea,
    int beds,
    int bathrooms,
    int propertyType,
    int furnishing,
  }) : super(
            location: location,
            city: city,
            price: price,
            ratings: ratings,
            floorArea: floorArea,
            beds: beds,
            bathrooms: bathrooms,
            propertyType: propertyType,
            furnishing: furnishing);

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      location: json["location"],
      city: json["city"],
      price: json["price"],
      ratings: json["ratings"],
      floorArea: json["floor_area"],
      beds: json["beds"],
      bathrooms: json["bathrooms"],
      propertyType: json["property_type"],
      furnishing: json["furnishing"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "location": location,
      "city": city,
      "price": price,
      "ratings": ratings,
      "floor_area": floorArea,
      "beds": beds,
      "bathrooms": bathrooms,
      "property_type": propertyType,
      "furnishing": furnishing,
    };
  }
}
