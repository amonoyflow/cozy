import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final String location;
  final int price;
  final int ratings;
  final int floorArea;
  final int beds;
  final int bathrooms;

  const Property({
    this.location,
    this.price,
    this.ratings,
    this.floorArea,
    this.beds,
    this.bathrooms,
  });

  @override
  List<Object> get props => [
        location,
        price,
        ratings,
        floorArea,
        beds,
        bathrooms,
      ];
}
