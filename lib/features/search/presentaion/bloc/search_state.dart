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
