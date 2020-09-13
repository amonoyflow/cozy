part of 'price_bloc.dart';

abstract class PriceEvent extends Equatable {
  const PriceEvent();

  @override
  List<Object> get props => [];
}

class PriceRangeChangedEvent extends PriceEvent {
  final RangeValues priceRange;

  PriceRangeChangedEvent({
    this.priceRange,
  });

  @override
  List<Object> get props => [priceRange];
}
