part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class PriceRangeLoaded extends SearchState {
  final RangeValues priceRange;

  PriceRangeLoaded({
    this.priceRange,
  });

  @override
  List<Object> get props => [priceRange];
}

class BedroomsLoaded extends SearchState {
  final String bedrooms;
  final int index;

  BedroomsLoaded({
    this.bedrooms,
    this.index,
  });

  @override
  List<Object> get props => [bedrooms, index];
}

class CitySearchLoaded extends SearchState {
  final String city;

  CitySearchLoaded({
    this.city,
  });

  @override
  List<Object> get props => [city];
}

class PropertyLoaded extends SearchState {
  final String property;
  final int index;

  PropertyLoaded({
    this.property,
    this.index,
  });

  @override
  List<Object> get props => [property, index];
}

class FurnishingLoaded extends SearchState {
  final String furnishing;
  final int index;

  FurnishingLoaded({
    this.furnishing,
    this.index,
  });

  @override
  List<Object> get props => [furnishing, index];
}
