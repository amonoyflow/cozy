part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class LocationSearchChangedEvent extends LocationEvent {
  final String location;

  LocationSearchChangedEvent({
    this.location,
  });

  @override
  List<Object> get props => [location];
}
