part of 'furnishing_bloc.dart';

abstract class FurnishingState extends Equatable {
  const FurnishingState();

  @override
  List<Object> get props => [];
}

class FurnishingInitial extends FurnishingState {}

class FurnishingError extends FurnishingState {}

class FurnishingLoaded extends FurnishingState {
  final String furnishing;
  final int index;

  FurnishingLoaded({
    @required this.furnishing,
    @required this.index,
  });

  @override
  List<Object> get props => [furnishing, index];
}
