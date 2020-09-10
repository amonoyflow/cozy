import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is PriceRangeChangedEvent) {
      yield PriceRangeLoaded(priceRange: event.priceRange);
    }
    if (event is BedroomsChangedEvent) {
      yield BedroomsLoaded(bedrooms: event.bedrooms, index: event.index);
    }
    if (event is LocationSearchChangedEvent) {
      yield CitySearchLoaded(city: event.location);
    }
    if (event is PropertyChangedEvent) {
      yield PropertyLoaded(property: event.property, index: event.index);
    }
    if (event is FurnishingChangedEvent) {
      yield FurnishingLoaded(furnishing: event.furnishing, index: event.index);
    }
  }
}
