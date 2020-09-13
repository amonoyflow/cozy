import 'package:cozy/features/search/domain/repositories/search_repository.dart';
import 'package:cozy/features/search/domain/entities/search_result.dart';
import 'package:cozy/core/usecases/usecase.dart';
import 'package:cozy/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class GetSearchResult implements UseCase<List<SearchResult>, NoParams> {
  final SearchRepository repository;

  GetSearchResult(this.repository);

  @override
  Future<Either<Failure, List<SearchResult>>> call(NoParams params) async {
    return await repository.getSearchResult();
  }
}
