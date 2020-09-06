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

  BedroomsChangedEvent({
    this.bedrooms,
  });

  @override
  List<Object> get props => [bedrooms];
}

class CitySearchChangedEvent extends SearchEvent {
  final String city;

  CitySearchChangedEvent({
    this.city,
  });

  @override
  List<Object> get props => [city];
}
