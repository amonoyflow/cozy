import 'package:cozy/core/errors/failures.dart';
import 'package:cozy/core/usecases/usecase.dart';
import 'package:cozy/features/home/domain/entities/property.dart';
import 'package:cozy/features/home/domain/repositories/properties_repository.dart';
import 'package:dartz/dartz.dart';

class GetProperties implements UseCase<List<Property>, NoParams> {
  final PropertiesRepository repository;

  GetProperties(this.repository);

  @override
  Future<Either<Failure, List<Property>>> call(NoParams params) async {
    return await repository.getAllProperties();
  }
}
