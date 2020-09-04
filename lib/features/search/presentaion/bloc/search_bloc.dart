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
      yield BedroomsLoaded(bedrooms: event.bedrooms);
    }
    if (event is CitySearchChangedEvent) {
      yield CitySearchLoaded(city: event.city);
    }
  }
}
