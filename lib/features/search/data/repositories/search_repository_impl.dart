import 'package:cozy/features/search/domain/repositories/search_repository.dart';
import 'package:cozy/features/search/data/datasources/search_remote.dart';
import 'package:cozy/features/search/data/datasources/search_local.dart';
import 'package:cozy/features/search/domain/entities/search_result.dart';
import 'package:cozy/features/search/domain/entities/city.dart';
import 'package:cozy/core/errors/exceptions.dart';
import 'package:cozy/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemote searchRemote;
  final SearchLocal searchLocal;

  SearchRepositoryImpl({
    @required this.searchRemote,
    @required this.searchLocal,
  });

  @override
  Future<Either<Failure, List<SearchResult>>> getSearchResult() async {
    try {
      final searchResult = await searchRemote.getSearchResult();
      return Right(searchResult);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<City>>> getSearchCities() async {
    try {
      final searchCities = await searchLocal.getSearchCities();
      return Right(searchCities);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
