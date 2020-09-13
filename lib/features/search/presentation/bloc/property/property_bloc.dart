import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'property_event.dart';
part 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  PropertyBloc() : super(PropertyInitial());

  int property;

  @override
  Stream<PropertyState> mapEventToState(
    PropertyEvent event,
  ) async* {
    if (event is PropertyChangedEvent) {
      property = event.index;
      yield PropertyLoaded(property: event.property, index: event.index);
    }
  }
}
