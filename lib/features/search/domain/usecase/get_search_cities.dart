import 'package:cozy/features/search/domain/repositories/search_repository.dart';
import 'package:cozy/features/search/domain/entities/city.dart';
import 'package:cozy/core/usecases/usecase.dart';
import 'package:cozy/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class GetSearchCities implements UseCase<List<City>, NoParams> {
  final SearchRepository repository;

  GetSearchCities(this.repository);

  @override
  Future<Either<Failure, List<City>>> call(NoParams params) async {
    return await repository.getSearchCities();
  }
}
