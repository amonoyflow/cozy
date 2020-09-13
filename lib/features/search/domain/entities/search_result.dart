import 'package:equatable/equatable.dart';

class SearchResult extends Equatable {
  final String location;
  final String city;
  final int price;
  final int ratings;
  final int floorArea;
  final int beds;
  final int bathrooms;
  final int propertyType;
  final int furnishing;

  const SearchResult({
    this.location,
    this.city,
    this.price,
    this.ratings,
    this.floorArea,
    this.beds,
    this.bathrooms,
    this.propertyType,
    this.furnishing,
  });

  @override
  List<Object> get props => [
        location,
        city,
        price,
        ratings,
        floorArea,
        beds,
        bathrooms,
        propertyType,
        furnishing,
      ];
}
