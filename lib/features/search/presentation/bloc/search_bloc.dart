import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cozy/core/errors/failures.dart';
import 'package:cozy/core/usecases/usecase.dart';
import 'package:cozy/features/search/domain/entities/search_result.dart';
import 'package:cozy/features/search/domain/usecase/get_search_result.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchResult getSearchResult;

  SearchBloc({
    @required GetSearchResult getSearchResult,
  })  : assert(getSearchResult != null),
        this.getSearchResult = getSearchResult,
        super(null);

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchTappedEvent) {
      final failureOrCities = await getSearchResult(NoParams());
      yield* _eitherLoadedOrErrorState(
        failureOrCities,
        event.bedroom,
        event.property,
        event.furnishing,
        event.price,
        event.location,
      );
    }
  }

  Stream<SearchState> _eitherLoadedOrErrorState(
    Either<Failure, List<SearchResult>> failureOrCities,
    int bedroom,
    int property,
    int furnishing,
    RangeValues price,
    String location,
  ) async* {
    yield failureOrCities.fold(
      (failure) => SearchError(),
      (success) {
        var b = bedroom == 0 || bedroom == null
            ? success
            : success.where((x) => x.beds == bedroom);
        var p = property == 0 || property == null
            ? b
            : b.where((x) => x.propertyType == property);
        var f = furnishing == 0 || furnishing == null
            ? p
            : p.where((x) => x.furnishing == furnishing);
        var pp = price == RangeValues(0, 100000) || price == null
            ? f
            : f.where((x) => x.price >= price.start && x.price <= price.end);
        var l = location == "" || location == null
            ? pp
            : pp.where(
                (x) => x.city.toLowerCase().contains(location.toLowerCase()));

        return SearchLoaded(count: l.length);
      },
    );
  }
}
