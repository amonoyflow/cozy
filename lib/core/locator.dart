import 'package:cozy/features/home/data/datasources/properties_remote.dart';
import 'package:cozy/features/home/data/repositories/properties_repository_impl.dart';
import 'package:cozy/features/home/domain/repositories/properties_repository.dart';
import 'package:cozy/features/home/domain/usecase/get_properties.dart';
import 'package:cozy/features/home/presentation/bloc/home_bloc.dart';
import 'package:cozy/features/search/data/datasources/search_local.dart';
import 'package:cozy/features/search/data/datasources/search_remote.dart';
import 'package:cozy/features/search/data/repositories/search_repository_impl.dart';
import 'package:cozy/features/search/domain/repositories/search_repository.dart';
import 'package:cozy/features/search/domain/usecase/get_search_cities.dart';
import 'package:cozy/features/search/domain/usecase/get_search_result.dart';
import 'package:cozy/features/search/presentation/bloc/bedroom/bedroom_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/furnishing/furnishing_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/location/location_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/price/price_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/property/property_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initializedLocator() {
  setupBloc();
  setupUsecases();
  setupRepositories();
  setupDataSources();
}

void setupBloc() {
  locator.registerFactory(() => HomeBloc(properties: locator()));
  locator.registerFactory(() => LocationBloc(getSearchCities: locator()));
  locator.registerFactory(() => SearchBloc(getSearchResult: locator()));
  locator.registerFactory(() => PriceBloc());
  locator.registerFactory(() => BedroomBloc());
  locator.registerFactory(() => PropertyBloc());
  locator.registerFactory(() => FurnishingBloc());
}

void setupUsecases() {
  locator.registerLazySingleton(() => GetProperties(locator()));
  locator.registerLazySingleton(() => GetSearchResult(locator()));
  locator.registerLazySingleton(() => GetSearchCities(locator()));
}

void setupRepositories() {
  locator.registerLazySingleton<PropertiesRepository>(
      () => PropertiesRepositoryImpl(propertiesRemote: locator()));

  locator.registerLazySingleton<SearchRepository>(() =>
      SearchRepositoryImpl(searchRemote: locator(), searchLocal: locator()));
}

void setupDataSources() {
  locator.registerLazySingleton<PropertiesRemote>(() => PropertiesRemoteImpl());
  locator.registerLazySingleton<SearchRemote>(() => SearchRemoteImpl());
  locator.registerLazySingleton<SearchLocal>(() => SearchLocalImpl());
}
