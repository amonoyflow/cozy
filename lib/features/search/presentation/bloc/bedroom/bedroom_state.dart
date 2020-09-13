part of 'bedroom_bloc.dart';

abstract class BedroomState extends Equatable {
  const BedroomState();

  @override
  List<Object> get props => [];
}

class BedroomInitial extends BedroomState {}

class BedroomError extends BedroomState {}

class BedroomLoaded extends BedroomState {
  final String bedrooms;
  final int index;

  BedroomLoaded({
    @required this.bedrooms,
    @required this.index,
  });

  @override
  List<Object> get props => [bedrooms, index];
}
