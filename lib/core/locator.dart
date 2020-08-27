import 'package:cozy/features/home/data/datasources/properties_remote.dart';
import 'package:cozy/features/home/data/repositories/properties_repository_impl.dart';
import 'package:cozy/features/home/domain/repositories/properties_repository.dart';
import 'package:cozy/features/home/domain/usecase/get_properties.dart';
import 'package:cozy/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initializedLocator() {
  setupBloc();
  setupUsecases();
  setupRepositories();
  setupDataSources();
}

void setupBloc() {
  locator.registerFactory(
    () => HomeBloc(
      properties: locator(),
    ),
  );
}

void setupUsecases() {
  locator.registerLazySingleton(() => GetProperties(locator()));
}

void setupRepositories() {
  locator.registerLazySingleton<PropertiesRepository>(
    () => PropertiesRepositoryImpl(
      propertiesRemote: locator(),
    ),
  );
}

void setupDataSources() {
  locator.registerLazySingleton<PropertiesRemote>(
    () => PropertiesRemoteImpl(),
  );
}
