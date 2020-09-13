part of 'property_bloc.dart';

abstract class PropertyEvent extends Equatable {
  const PropertyEvent();

  @override
  List<Object> get props => [];
}

class PropertyChangedEvent extends PropertyEvent {
  final String property;
  final int index;

  PropertyChangedEvent({
    this.property,
    this.index,
  });

  @override
  List<Object> get props => [property, index];
}
