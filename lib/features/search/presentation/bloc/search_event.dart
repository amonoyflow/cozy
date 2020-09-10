part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class PriceRangeChangedEvent extends SearchEvent {
  final RangeValues priceRange;

  PriceRangeChangedEvent({
    this.priceRange,
  });

  @override
  List<Object> get props => [priceRange];
}

class BedroomsChangedEvent extends SearchEvent {
  final String bedrooms;
  final int index;

  BedroomsChangedEvent({
    this.bedrooms,
    this.index,
  });

  @override
  List<Object> get props => [bedrooms, index];
}

class LocationSearchChangedEvent extends SearchEvent {
  final String location;

  LocationSearchChangedEvent({
    this.location,
  });

  @override
  List<Object> get props => [location];
}

class PropertyChangedEvent extends SearchEvent {
  final String property;
  final int index;

  PropertyChangedEvent({
    this.property,
    this.index,
  });

  @override
  List<Object> get props => [property, index];
}

class FurnishingChangedEvent extends SearchEvent {
  final String furnishing;
  final int index;

  FurnishingChangedEvent({
    this.furnishing,
    this.index,
  });

  @override
  List<Object> get props => [furnishing, index];
}
