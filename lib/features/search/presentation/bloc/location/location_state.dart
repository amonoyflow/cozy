part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationError extends LocationState {}

class LocationLoaded extends LocationState {
  final String location;
  final List<City> cities;

  LocationLoaded({
    @required this.location,
    @required this.cities,
  });

  @override
  List<Object> get props => [location, cities];
}
