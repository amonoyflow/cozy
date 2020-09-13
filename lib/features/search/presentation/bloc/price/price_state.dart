part of 'price_bloc.dart';

abstract class PriceState extends Equatable {
  const PriceState();

  @override
  List<Object> get props => [];
}

class PriceInitial extends PriceState {}

class PriceError extends PriceState {}

class PriceRangeLoaded extends PriceState {
  final RangeValues priceRange;

  PriceRangeLoaded({
    @required this.priceRange,
  });

  @override
  List<Object> get props => [priceRange];
}
