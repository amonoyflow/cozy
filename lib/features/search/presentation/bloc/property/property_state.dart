part of 'property_bloc.dart';

abstract class PropertyState extends Equatable {
  const PropertyState();

  @override
  List<Object> get props => [];
}

class PropertyInitial extends PropertyState {}

class PropertyError extends PropertyState {}

class PropertyLoaded extends PropertyState {
  final String property;
  final int index;

  PropertyLoaded({
    @required this.property,
    @required this.index,
  });

  @override
  List<Object> get props => [property, index];
}
