import 'package:cozy/features/search/domain/entities/search_result.dart';
import 'package:cozy/features/search/domain/entities/city.dart';
import 'package:cozy/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchResult>>> getSearchResult();
  Future<Either<Failure, List<City>>> getSearchCities();
}
