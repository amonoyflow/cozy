import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bedroom_event.dart';
part 'bedroom_state.dart';

class BedroomBloc extends Bloc<BedroomEvent, BedroomState> {
  BedroomBloc() : super(BedroomInitial());

  int bedroom;

  @override
  Stream<BedroomState> mapEventToState(
    BedroomEvent event,
  ) async* {
    if (event is BedroomsChangedEvent) {
      bedroom = event.index;
      yield BedroomLoaded(bedrooms: event.bedrooms, index: event.index);
    }
  }
}
