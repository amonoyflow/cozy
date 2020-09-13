part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchTappedEvent extends SearchEvent {
  final int bedroom;
  final int property;
  final int furnishing;
  final RangeValues price;
  final String location;

  SearchTappedEvent({
    this.bedroom,
    this.property,
    this.furnishing,
    this.price,
    this.location,
  });

  @override
  List<Object> get props => [bedroom, property, furnishing, price, location];
}
