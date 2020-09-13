import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'furnishing_event.dart';
part 'furnishing_state.dart';

class FurnishingBloc extends Bloc<FurnishingEvent, FurnishingState> {
  FurnishingBloc() : super(FurnishingInitial());

  int furnishing;

  @override
  Stream<FurnishingState> mapEventToState(
    FurnishingEvent event,
  ) async* {
    if (event is FurnishingChangedEvent) {
      furnishing = event.index;
      yield FurnishingLoaded(furnishing: event.furnishing, index: event.index);
    }
  }
}
