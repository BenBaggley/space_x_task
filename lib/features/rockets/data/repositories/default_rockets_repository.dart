import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/rockets/domain/data_sources/rockets_data_source.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';
import 'package:space_x/features/rockets/domain/repositories/rockets_repository.dart';

/// {@template default_rockets_repository}
/// Implementation of the [RocketsRepository] using [RocketsDataSource]
/// {@endtemplate}
@Injectable(as: RocketsRepository)
class DefaultRocketsRepository implements RocketsRepository {
  final RocketsDataSource _rocketsDataSource;

  /// {@macro default_rockets_repository}
  const DefaultRocketsRepository(this._rocketsDataSource);

  @override
  Future<Either<Failure, List<Rocket>>> getRockets() =>
      _rocketsDataSource.getRockets();
}
