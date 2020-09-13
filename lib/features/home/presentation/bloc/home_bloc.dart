import 'package:cozy/features/home/domain/usecase/get_properties.dart';
import 'package:cozy/features/home/domain/entities/property.dart';
import 'package:cozy/core/errors/failures.dart';
import 'package:cozy/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProperties getProperties;

  HomeBloc({
    @required GetProperties properties,
  })  : assert(properties != null),
        getProperties = properties,
        super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is InitialProperties) {
      final failureOrProperty = await getProperties(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrProperty);
    }
  }

  Stream<HomeState> _eitherLoadedOrErrorState(
    Either<Failure, List<Property>> failureOrProperty,
  ) async* {
    yield failureOrProperty.fold(
      (failure) => HomeError(message: "Error"),
      (success) => HomeLoaded(properties: success),
    );
  }
}
