import 'package:cozy/features/home/domain/repositories/properties_repository.dart';
import 'package:cozy/features/home/data/datasources/properties_remote.dart';
import 'package:cozy/features/home/domain/entities/property.dart';
import 'package:cozy/core/errors/exceptions.dart';
import 'package:cozy/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class PropertiesRepositoryImpl implements PropertiesRepository {
  final PropertiesRemote propertiesRemote;

  PropertiesRepositoryImpl({@required this.propertiesRemote});

  @override
  Future<Either<Failure, List<Property>>> getAllProperties() async {
    try {
      final properties = await propertiesRemote.getAllProperties();
      return Right(properties);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
