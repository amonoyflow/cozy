part of 'furnishing_bloc.dart';

abstract class FurnishingEvent extends Equatable {
  const FurnishingEvent();

  @override
  List<Object> get props => [];
}

class FurnishingChangedEvent extends FurnishingEvent {
  final String furnishing;
  final int index;

  FurnishingChangedEvent({
    this.furnishing,
    this.index,
  });

  @override
  List<Object> get props => [furnishing, index];
}
