import 'package:cozy/core/errors/failures.dart';
import 'package:cozy/features/home/domain/entities/property.dart';
import 'package:dartz/dartz.dart';

abstract class PropertiesRepository {
  Future<Either<Failure, List<Property>>> getAllProperties();
}
