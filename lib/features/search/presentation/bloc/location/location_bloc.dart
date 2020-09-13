import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cozy/core/errors/failures.dart';
import 'package:cozy/core/usecases/usecase.dart';
import 'package:cozy/features/search/domain/entities/city.dart';
import 'package:cozy/features/search/domain/usecase/get_search_cities.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetSearchCities getSearchCities;
  String location;

  LocationBloc({
    @required GetSearchCities getSearchCities,
  })  : assert(getSearchCities != null),
        this.getSearchCities = getSearchCities,
        super(LocationInitial());

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is LocationSearchChangedEvent) {
      location = event.location;
      final failureOrCities = await getSearchCities(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrCities, event.location);
    }
  }

  Stream<LocationState> _eitherLoadedOrErrorState(
    Either<Failure, List<City>> failureOrCities,
    String location,
  ) async* {
    yield failureOrCities.fold(
      (failure) => LocationError(),
      (success) => LocationLoaded(location: location, cities: success),
    );
  }
}
