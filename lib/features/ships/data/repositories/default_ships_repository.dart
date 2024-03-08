import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/ships/domain/data_sources/ships_data_source.dart';
import 'package:space_x/features/ships/domain/entities/ship.dart';
import 'package:space_x/features/ships/domain/repositories/ships_repository.dart';

/// {@template default_ships_repository}
/// Implementation of the [ShipsRepository] using [ShipsDataSource]
/// {@endtemplate}
@Injectable(as: ShipsRepository)
class DefaultShipsRepository implements ShipsRepository {
  final ShipsDataSource _shipsDataSource;

  /// {@macro default_ships_repository}
  const DefaultShipsRepository(this._shipsDataSource);

  @override
  Future<Either<Failure, List<Ship>>> getShips() => _shipsDataSource.getShips();
}
