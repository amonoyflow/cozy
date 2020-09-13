part of 'bedroom_bloc.dart';

abstract class BedroomEvent extends Equatable {
  const BedroomEvent();

  @override
  List<Object> get props => [];
}

class BedroomsChangedEvent extends BedroomEvent {
  final String bedrooms;
  final int index;

  BedroomsChangedEvent({
    this.bedrooms,
    this.index,
  });

  @override
  List<Object> get props => [bedrooms, index];
}
