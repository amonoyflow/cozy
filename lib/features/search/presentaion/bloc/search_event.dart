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
