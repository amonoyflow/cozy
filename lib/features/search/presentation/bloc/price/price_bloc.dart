import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'price_event.dart';
part 'price_state.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  PriceBloc() : super(PriceInitial());

  RangeValues price;

  @override
  Stream<PriceState> mapEventToState(
    PriceEvent event,
  ) async* {
    if (event is PriceRangeChangedEvent) {
      price = event.priceRange;
      yield PriceRangeLoaded(priceRange: event.priceRange);
    }
  }
}
